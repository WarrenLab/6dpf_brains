# Scripts and notebooks for Gallman et al. 2026

This repository contains scripts and notebooks used to perform all data analysis in the manuscript

Gallman et al. (in preparation). "Comparative single-cell RNA sequencing brain atlas of larval Astyanax mexicanus surface and Pachón cavefish."

## Prerequisites

### Software

* [cellranger](https://www.10xgenomics.com/support/software/cell-ranger/latest) v9.0.1
* [cellbender](https://github.com/broadinstitute/CellBender) v0.3.0
* [scanpy](https://scanpy.readthedocs.io/en/stable/) v1.9.8

### Input files

* Cellranger-ready reference genome, in `ref/`
* All reads in fastq format, in `reads/`
* Sample sheet formatted for Cellranger input and containing 'population' as additional metadata column (cave/surface), at `samples.csv`

## Steps

1. Run CellRanger once per sample. This is presented as a SLURM array job here, but may need to be modified depending on your setup.
2. Run CellBender once per sample. This is also presented a a SLURM array job here.
3. Cluster using scanpy. This is performed in a Jupyter notebook.
