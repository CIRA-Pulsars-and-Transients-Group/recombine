#!/bin/bash
 
# Assuming all the input files exist in the current directory, we run the executable.
# Each instance will use the appropriate input and produce the relevant output.

OBSID=$1
STARTTIME=$2
ENDTIME=$3
SRCDIR=$4
METAFITS=$5
DESTDIR=$6
SKIP_ICS=$7
NTASKS=$8

GPSSECOND=$(echo "$STARTTIME + $SLURM_PROCID" | bc)

while [ $GPSSECOND -le $ENDTIME ]
do
    echo -n "Process $SLURM_PROCID recombining second ${GPSSECOND}... "
    recombine \
        -o $OBSID \
        -t $GPSSECOND \
        -m $METAFITS \
        -i $DESTDIR \
        -s $SKIP_ICS \
        -f $SRCDIR/${OBSID}_${GPSSECOND}_vcs*.dat

    echo "DONE"

    GPSSECOND=$(echo "$GPSSECOND + $NTASKS" | bc)
done
