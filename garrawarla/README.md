# Using `recombine` on Garrawarla

The `recombine` executable processes one second of data as a single CPU process.
Processing a single second only therefore requires a simple SBATCH script, an example of which is given in [`recombine_1second.sbatch`](recombine_1second.sbatch).
For processing multiple seconds, we provide an example of how to pack recombine jobs for a given number of nodes and tasks, based on the Pawsey examples given on the [Job Scheduling](https://support.pawsey.org.au/documentation/display/US/Example+Workflows#ExampleWorkflows-Method1:UsingSLURM_PROCID) page of their documentation.
A minimal "wrapper" script ([`recombine_wrapper.sh`](recombine_wrapper.sh)) decides which task will process which seconds, based on the special `$SLURM_PROCID` environment variable.
Then, an SBATCH script ([`recombine_example.sbatch`](recombine_example.sbatch)) calls the wrapper with the desired number of nodes and tasks-per-node set.

([`recombine_wrapper.sh`](recombine_wrapper.sh)) can be used as is without editing, but ([`recombine_example.sbatch`](recombine_example.sbatch)) should be edited according to each job.
**Note that NVME is not being used in these examples, but it *should* be (and relevant instructions will be added to this README soon, see [the Pawsey documentation](https://support.pawsey.org.au/documentation/display/US/Garrawarla+Documentation#GarrawarlaDocumentation-RequestingNVMeresourcesinSLURM) in the meantime).**

## Choosing the number of nodes and the number of tasks

In principle, any number of nodes and tasks can be chosen (up to what is available on Garrawarla).
Each CPU has ~370 GB of memory available, and each second of input data is about 7.5 GB.
The actual memory usage of `recombine` has not been benchmarked, but it is likely that a large number (possibly the max allowed??) is allowed.
Performance for different configurations has also not been benchmarked.
