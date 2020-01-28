cp program.va ../src/picoversat/tests/project/program.va
cd ../src/picoversat/simulation/icarus
make test="project"
cd ../../../../Asm
cp ../src/picoversat/simulation/icarus/program.hex program.hex
cp program.hex /media/afonsom/FE23-C94A/program.hex
