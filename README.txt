I took the source code of perf from the version 6.17.0 of kernel linux.
When you are using "perf stat" to monitoring a software on an HPC infrastructure you may want to know on which socket the program is running, this is the porpouse of this extension.

-----WHICH FILE YOU NEED TO CHANGE-----
You just need to replace this file: tools/perf/util/evlist.c
In this repo you can find the new version of it.

-----TO COMPILE-----
If you want to compile the code on your Desktop pc you just need to:
download the linux kernel code
go to -> source_code/tools/perf
run "make"
Eventually you have to install the missing dependencies

If you want to compile it on LEONARDO of CINECA
Upload the code on the login node by following the Cineca s documentation
Then run:
spack load bison
module load python
go to source/tools/perf
run make NO_LIBTRACEEVENT=1 NO_LIBELF=1 NO_LIBBFD=1 NO_JAVA=1

Run "make" with these flags will remove some perf features, but if your goal is to use "perf stat" there will be no problems.

In the following example i called the executable version of my perf "perf-est"

Then there are two ways for run your new perf version on Leonardo:
1. run "srun --cpu-bind=core ./perf-est stat ./test"
   You can replace test with whatever program you want.

2. Create a sbatch file, you can find mine in this repo with the name "run_perf.sh"
   Change the fields with the best values for you
   Run "sbatch run_perf.sh"
   You will find the output in the prevoius specified output file.
