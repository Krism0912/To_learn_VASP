rm -f loop_lattice_constant.dat
for ratio in 1.60 1.63 1.66 1.70 1.74
do
for a in 2.4 2.44 2.48 2.50 2.52 2.54 2.56 2.6 2.64 2.68 2.75 2.8
do
cat > POSCAR << EOF
hcp Cu
$a
 0.866 -0.5 0.0
 0.0 1.0 0.0
 0.0 0.0 $ratio
2
Direct
0 0 0
0.6667 0.3333 0.5
EOF

mpirun -np 2 vasp_std

en=$(awk '/F=/ {print $0}' OSZICAR)
echo $ratio $a $en  >> loop_lattice_constant.dat
done
done
