#####################################################################
#
# Benchmark for unbias and wt aBMD simulations AMBERv16 pmemd.cuda
#
# System - 99,136 atoms(Small peptide in water)
#
# Conditions - Cubic system, NVT, PME, and periodic 
#
######################################################################

#PBS -N BenchGROMACS
#PBS -l nodes=1:ppn=20
#PBS -j oe
#PBS -q gpu

#native pmemd.cuda
pmemd.cuda -O -i native.in -p system.prmtop -c npt.rst -r bench.rst -x bench.nc &> native.log

#wt aBMD pmemd.cuda
pmemd.cuda -O -i bias.in -p system.prmtop -c npt.rst -r bench.rst -x bench.nc &> bias.log

