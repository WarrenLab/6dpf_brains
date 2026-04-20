#!/bin/bash -e
#SBATCH -a 1-8
#SBATCH --account warrenwc-lab
#SBATCH -p general,warrenwc-lab
#SBATCH --cpus-per-task 8
#SBATCH --mem 125G
#SBATCH -t 2-00:00:00
#SBATCH -o logs/cellranger.%a.out
#SBATCH -e logs/cellranger.%a.err

library_id=$(cut -d, -f1 samples.csv | head -n $((SLURM_ARRAY_TASK_ID+1)) | tail -n 1)
sample_id=$(cut -d, -f2 samples.csv | head -n $((SLURM_ARRAY_TASK_ID+1)) | tail -n 1)

/mnt/pixstor/data/esrbhb/software/cellranger-9.0.1/bin/cellranger count \
    --id $sample_id \
    --sample $library_id \
    --transcriptome ref/ \
    --fastqs reads/ \
    --localcores $SLURM_CPUS_PER_TASK \
    --localmem 100 \
    --output-dir out/cellranger/$sample_id \
    --create-bam true \
    --disable-ui
