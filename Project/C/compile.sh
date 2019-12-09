
/usr/local/versat/lcc/lcc -S -c test.c -o ../src/picoversat/tests/project/program.va
cd ../src/picoversat/simulation/icarus
make test="project"
cd ../../../../C
cp ../src/picoversat/simulation/icarus/program.hex program.hex
