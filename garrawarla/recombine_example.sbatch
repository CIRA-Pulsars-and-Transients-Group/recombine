#!/bin/bash -l

#SBATCH --nodes=2
#SBATCH --ntasks-per-node=3
#SBATCH --mem=370gb
#SBATCH --time=00:10:00
#SBATCH --partition=workq
#SBATCH --account=mwavcs
#SBATCH --job-name=recombine_test
#SBATCH --output=recombine_test.out

module use /pawsey/mwa/software/python3/modulefiles
module load recombine

# Edit these for your specific job
OBSID=1267111608
STARTTIME=1267111610
ENDTIME=1267116407
SRCDIR=/astro/mwavcs/asvo/571584
METAFITS=/astro/mwavcs/vcs/1267111608/1267111608_metafits_ppds.fits
DESTDIR=.
SKIP_ICS=1

# Edit these to match the SBATCH directives above
NNODES=2
NTASKSPERNODE=3

NTASKS=$(echo "$NNODES * $NTASKSPERNODE" | bc)

srun -N $NNODES -n $NTASKS ./recombine_wrapper.sh $OBSID $STARTTIME $ENDTIME $SRCDIR $METAFITS $DESTDIR $SKIP_ICS $NTASKS
