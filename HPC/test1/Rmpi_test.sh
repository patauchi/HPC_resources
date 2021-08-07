#!/bin/bash
#SBATCH --job-name=hetero_job      # Job name
#SBATCH --partition=sixhour          # Partition Name (Required)
#SBATCH --mail-type=END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=patauchi@gmail.com     # Where to send mail
#SBATCH --constraint=intel     
#SBATCH --ntasks=20
#SBATCH --cpus-per-task=1            # Number of CPU cores per task
#SBATCH --mem-per-cpu=4g            # Job memory request
#SBATCH --nodes=4                # Run across 2 nodes

module load openmpi/1.10
module load R/4.0
export OMPI_MCA_btl="^openib"

# when using OpenMPI, mpirun is needed
mpirun -np 1 R CMD BATCH --no-save --no-restore test2.R test2.out


