#####################################################################
#
# Benchmark for unbias, plumed and fABMACS GROMACS versions  
#
# System - 99,136 atoms(Small peptide in water)
#
# Conditions - Cubic system, NVT, PME, and periodic 
#
######################################################################

#PBS -N BenchGROMACS
#PBS -l nodes=7:ppn=28
#PBS -j oe
#PBS -q longq
#PBS -l walltime=480:00:00

cd  $PBS_O_WORKDIR
list=`cat $PBS_NODEFILE|uniq`;for item in $list; do echo 10.152.220.$((`echo $item |sed -e 's/node//g;s/^0*//g'` +20));done >nodes

grompp -f prod.mdp -c npt.gro -o prod

# native gromacs
mpirun -f nodes -np 196 mdrun_mpi -ntomp 1 -deffnm prod -pin on &> native.log

# fACMACS installation
mpirun -f nodes -np 196 ../fABMACS/bin/mdrun_mpi -ntomp 1 -deffnm prod -pin on &> fabmacs.log

# plumed installation
mpirun -f nodes -np 196 ../plumed/bin/gmx_mpi mdrun -deffnm prod -pin on -plumed plumed.dat &> plumed.log

