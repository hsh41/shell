set -u
cd ~/gnd
# python -m pandar_process.src.transform.obs_car \
# 	--input_dir "/home/shenhuahu/data/M1_20190909/prediction_velodyne" \
# 	--out_file "./tmp.csv" \
#     --map_id "1" \
#     --date "20190909"
# echo step1
csv2bag.sh tmp.csv res.bag ~/data/M1_20190909/_2019-09-09-15-16-21_0.bag
# echo step2
# python -m pandar_process.src.transform.obs_map \
# 	--car_map_csv "/home/shenhuahu/data/M1_20190909/car_status_20190909_data_num_1.csv" \
# 	--obs_car_csv "./tmp.csv" \
# 	--out_file "/home/shenhuahu/data/M1_20190909/res.csv"
rosbag play ~/data/M1_20190909/_2019-09-09-15-16-21_0.bag res.bag
cd -
