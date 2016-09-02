#####################################################################
#
# Benchmark for unbias and wt metadynamics simulations NAMD2.11
#
# System - 99,136 atoms(Small peptide in water)
#
# Conditions - Cubic system, NVT, PME, and periodic 
#
######################################################################

#PBS -N namdBench
#PBS -l nodes=7:ppn=28
#PBS -j oe
#PBS -q longq
#PBS -l walltime=480:00:00

cd  $PBS_O_WORKDIR
list=`cat $PBS_NODEFILE|uniq`;for item in $list; do echo 10.152.220.$((`echo $item |sed -e 's/node//g;s/^0*//g'` +20));done >nodes

mpirun -f nodes -np 196 namd2 native.namd &> native.log
mpirun -f nodes -np 196 namd2 bias.namd &> bias.log

