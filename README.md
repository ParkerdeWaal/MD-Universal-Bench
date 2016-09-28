### Universal molecular dynamics benchmark system

Created to provide a common, comparable benchmark system to test scalability of GROMACS, NAMD and AMBER molecular dynamics packages. The test system comprises a short peptide solvated in water for a total of 99,137 atoms.

All simulations are performed in the canonical, NVT ensemble with PME and periodic boundies enabled.

Each folder contains a sample PBS submission script ```bench.sh```. Edit this file to match your program installation locations and HPC scheduler format.
