rm -f loop_lattice_constant.dat
for a in  3.2 3.3 3.4 3.45 3.5 3.55 3.6 3.65 3.7 3.8 3.9 4.0
do
cat > POSCAR << EOF
fcc Cu
$a
 0.5 0.5 0.0
 0.0 0.5 0.5
 0.5 0.0 0.5
1
cartesian
0 0 0
EOF

mpirun -np 2 vasp_std

en=$(awk '/F=/ {print $0}' OSZICAR)
echo $a $en  >> loop_lattice_constant.dat
done
