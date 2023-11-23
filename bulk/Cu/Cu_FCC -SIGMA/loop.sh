rm -f RESULT.dat
for a in  $(seq 0.2 -0.01 0.02)
do
cat > INCAR << EOF
System = fcc Cu

ISTART = 0    ! start from scratch
ICHARG = 0    ! superposition of atomic charge densities

ENCUT  = 292  ! energy cutoff
ISMEAR = 0    ! Gaussian smearing
SIGMA = $a   ! broadening
GGA = 91
EOF

mpirun -np 2 vasp_std

en=$(awk '/F=/ {print $0}' OSZICAR)
echo $a $en  >> RESULT.dat
done
