#!/bin/bash

#SBATCH --job-name=MiniProject1-LL
#SBATCH --partition=veryshort
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
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

python setup_LebwohlLasher_cython_parallel.py build_ext --inplace 
python -m cProfile run_LebwohlLasher_cython_parallel.py 50 50 0.5 0 2 > prof1_cython_parallel.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 50 0.5 0 > prof2_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 50 0.5 0 > prof3_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 50 0.5 0 > prof4_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 50 0.5 0 > prof5_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 50 0.5 0 > prof6_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 50 0.5 0 > prof7_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 50 0.5 0 > prof8_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 50 0.5 0 > prof9_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 50 0.5 0 > prof10_cython.txt

# python -m cProfile run_LebwohlLasher_cython.py 50 1 0.5 0 > prof_1_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 10 0.5 0 > prof_10_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 25 0.5 0 > prof_25_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 50 0.5 0 > prof_50_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 100 0.5 0 > prof_100_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 250 0.5 0 > prof_250_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 500 0.5 0 > prof_500_cython.txt
# python -m cProfile run_LebwohlLasher_cython.py 50 1000 0.5 0 > prof_1000_cython.txt

# End recording the end time
end_time=$(date +%s)

# Calculate and print the runtime
runtime=$((end_time - start_time))
echo "Total runtime: $runtime seconds"