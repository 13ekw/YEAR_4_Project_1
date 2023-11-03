#!/bin/bash

#SBATCH --job-name=MiniProject1-LL
#SBATCH --partition=teach_cpu
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=0:0:10
#SBATCH --mem-per-cpu=100M
#SBATCH --account=PHYS030544

# Load anaconda environment
module add languages/anaconda3/2020-3.8.5
module load languages/intel/2020-u4

# Change to working directory, where job was submitted from
cd "${SLURM_SUBMIT_DIR}"

# Record some potentially useful details about the job: 
echo "Running on host $(hostname)"
echo "Started on $(date)"
echo "Directory is $(pwd)"
echo "Slurm job ID is ${SLURM_JOBID}"
echo "This jobs runs on the following machines:"
echo "${SLURM_JOB_NODELIST}"
echo "CPUs per task = ${SLURM_CPUS_PER_TASK}"
printf "\n\n"

# Submitting and timing code runs
# Recording start time
start_time=$(date +%s)

mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 50 0.5 0

# Calculate and print the runtime
runtime=$((end_time - start_time))
echo "Total runtime: $runtime seconds"