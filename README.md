# recombine
Tool for pre-processing legacy MWA voltage data

## What is it and what does it do?

Takes one seconds worth of uncombined MWA voltage data (32 input files) and recombines it.
Each uncombined product contains 1/4 of the tiles for 1/8 of the frequency.
The resultant product will be 24 files with each file containing all of the tiles for that
course channel (1.28MHz wide) for one second. The recombiner will also generate an incoherent
sum (collapse tiles into a single power value losing phase information) for each 10kHz
block for the entire array for that seconds worth of data. If there is data missing for a
particular pfb output lane then the recombiner will set that data input to zero.

## Usage:

```
recombine -o <obsid> -t <secondid> -m <meta-data fits> -i <output dir> 
          -c <skip course chan> -s <skip ICS> -f <file list> or -g <input file list>

<obsid>: observation id of the data being processed.
<secondid>: the second which is being processed
<meta-data fits>: meta-data fits file containing tile flag information and various orther useful 
information regarding the observation. To obtain the meta-data fits file for a particular observation 
use the following: 
    wget -O <obsid>.metafits http://ws.mwatelescope.org/metadata/fits?obs_id=<obsid>
<output dir>: output product directory
<skip course chan>: 1 will skip the generation of the recombined course channel data
<skip ICS>: 1 will skip the generation of the incoherent sum
<input file list>: location of 32 raw uncombined input files for a single seconds worth of data (separate each with a space)
<input file list>: a file containing the location of the 32 raw uncombined input files (separate by newline)
```

## Obtaining data:

Downloading data is now done via the ASVO client.
See the [Data Access page on the MWA Telescope Wiki](https://wiki.mwatelescope.org/display/MP/Data+Access) for more information.

Only a subset of (archived) MWA data will even require recombining, because in many cases the already-recombined
data were stored in the archive.
Some wrapper scripts for automatically recombining are available in [VCSTools](https://github.com/CIRA-Pulsars-and-Transients-Group/vcstools/tree/development) and [mwa_search](https://github.com/NickSwainston/mwa_search).
