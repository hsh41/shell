rm *png
python /home/shenhuahu/gnd/pandar_process/src/track/remove_ego_det_err.py \
	--car_csv_pn="/home/shenhuahu/20190909/car_status_20190909.csv" \
	--obs_csv_pn="/home/shenhuahu/20190909/obstacles_20190909_untracked.csv" \
	--res_pn="/home/shenhuahu/20190909/res1.csv"
