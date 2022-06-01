#!/bin/bash -l
 
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=370gb
#SBATCH --time=00:10:00
#SBATCH --partition=workq
#SBATCH --account=mwavcs
#SBATCH --job-name=recombine_test
#SBATCH --output=recombine_test.out
 
module use /pawsey/mwa/software/python3/modulefiles
module load recombine
 
srun -n 1 -N 1 recombine \
    -o 1267111608 \
    -t 1267111610 \
    -m /astro/mwavcs/vcs/1267111608/1267111608_metafits_ppds.fits \
    -i . \
    -s 1 \
    -f /astro/mwavcs/vcs/1267111608/raw/1267111608_1267111610_vcs*.dat
