cd ~/gnd
csv2bag.sh /home/shenhuahu/data/20190920/obstacles_20190920_data_num_1_tracked.csv res.bag
rosbag play ~/data/20190920/_2019-09-20-14-53-15_1.bag res.bag
cd -
