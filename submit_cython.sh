#!/bin/bash

#SBATCH --job-name=MiniProject1-LL
#SBATCH --partition=veryshort
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=6:0:0
#SBATCH --mem-per-cpu=100M
#SBATCH --account=PHYS030544

# Load anaconda environment
module add languages/anaconda3/2022.11-3.9.13

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

# File run

python setup_LebwohlLasher_cython.py build_ext --inplace 

#num runs
#x=10

#for((i=1; i<=$x; i++)); do 
#python -m cProfile run_LebwohlLasher_cython.py 50 50 0.5 0 > prof<$x>_cython.txt
python -m cProfile run_LebwohlLasher_cython.py 50 50 0.5 0 > prof1_cython.txt

#done

# End recording the end time
end_time=$(date +%s)

# Calculate and print the runtime
runtime=$((end_time - start_time))
echo "Total runtime: $runtime seconds"