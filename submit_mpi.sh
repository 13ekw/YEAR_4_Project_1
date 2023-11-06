#!/bin/bash

#SBATCH --job-name=MiniProject1-LL
#SBATCH --partition=veryshort
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

# mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 50 0.5 0 > prof5_mpi_8.txt
# mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 50 0.5 0 > prof6_mpi_8.txt
# mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 50 0.5 0 > prof7_mpi_8.txt
# mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 50 0.5 0 > prof8_mpi_8.txt
# mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 50 0.5 0 > prof5_mpi_2.txt
# mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 50 0.5 0 > prof6_mpi_2.txt
# mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 50 0.5 0 > prof7_mpi_2.txt
# mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 50 0.5 0 > prof8_mpi_2.txt
# mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 50 0.5 0 > prof9_mpi_2.txt
# mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 50 0.5 0 > prof10_mpi_2.txt

mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 1 0.5 0 > prof_1_mpi4py_8.txt
mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 10 0.5 0 > prof_10_mpi4py_8.txt
mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 25 0.5 0 > prof_25_mpi4py_8.txt
mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 50 0.5 0 > prof_50_mpi4py_8.txt
mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 100 0.5 0 > prof_100_mpi4py_8.txt
mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 250 0.5 0 > prof_250_mpi4py_8.txt
mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 500 0.5 0 > prof_500_mpi4py_8.txt
mpiexec -n 4 python -m cProfile LebwohlLasher_mpi4py.py 50 1000 0.5 0 > prof_1000_mpi4py_8.txt



# Calculate and print the runtime
runtime=$((end_time - start_time))
echo "Total runtime: $runtime seconds"