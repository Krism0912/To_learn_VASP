rm -f loop_lattice_constant.dat
for a in  2.0 2.1 2.2 2.3 2.4 2.45 2.5 2.55 2.6 2.7 2.8 2.9 3.0
do
cat > POSCAR << EOF
sc Cu
$a
 1.0 0.0 0.0
 0.0 1.0 0.0
 0.0 0.0 1.0
1
cartesian
0 0 0
EOF

mpirun -np 2 vasp_std

en=$(awk '/F=/ {print $0}' OSZICAR)
echo $a $en  >> loop_lattice_constant.dat
done
