#!/bin/bash
#SBATCH --job-name=serial_job
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntask=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=lrd_all_serial
#SBATCH --mem=2G
#SBATCH --output=serialJob.out

#Execution
srun ./perf-est stat ./test
