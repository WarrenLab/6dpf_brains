#!/bin/bash -e
#SBATCH -a 1-8
#SBATCH -p gpu
#SBATCH --gres gpu:A100:1
#SBATCH --mem 32G
#SBATCH -t 2:00:00
#SBATCH -o logs/cellbender.%a.out
#SBATCH -e logs/cellbender.%a.err

eval "$(conda shell.bash hook)"
conda activate cellbender

sample_id=$(cut -d, -f2 samples.csv | head -n $((SLURM_ARRAY_TASK_ID+1)) | tail -n 1)

# this is necessary because multiple instances cannot be run simultaneously
# from the same directory
mkdir -p out/cellbender/${sample_id}
cd out/cellbender/${sample_id}

cellbender remove-background \
    --cuda \
    --input ../../cellranger/${sample_id}/outs/raw_feature_bc_matrix.h5 \
    --output ${sample_id}.cellbender.h5
