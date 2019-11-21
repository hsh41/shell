echo 'generate bag file from csv'
echo "source file $1"
echo "destination file $2"
echo "compensate time $3"

cd ~/gnd
python  ~/gnd/pandar_process/src/tools/csv2bag.py $1 $2 $3
# python -m cProfile -s cumulative ~/gnd/pandar_process/src/tools/csv2bag.py $1 $2 $3
cd -
