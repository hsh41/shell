#!/bin/bash
PARALLEL_NUM=12
DATE=20190920
DATA_NUM=1

cd ~/gnd
# python -m pandar_process.src.track.track_det \
# 	--obs_csv_pn="/home/shenhuahu/data/M1_20190909/obstacles_20190909_untracked.csv" \
# 	--res_pn="/home/shenhuahu/data/M1_20190909/res_tracked.csv" \
    # --max_age "5"

python -m pandar_process.src.track.track_det \
	--obs_csv_pn="/home/shenhuahu/data/20190920/obstacles_20190920_untracked.csv" \
	--res_pn="/home/shenhuahu/tdt/tmp/res.csv"

# tmpfifo=$$.fifo
# trap "exec 1000>&-;exec 1000<&-;exit 0" 2
# mkfifo $tmpfifo
# exec 1000<>$tmpfifo
# rm -rf $tmpfifo
# for i in `seq 1 ${PARALLEL_NUM}`
# do
#     echo $i
#     echo >&1000
# done


# for idx in {0..6}
# do
#     read -u1000
#     {
#         let "start = idx * 200"
#         let "end = idx * 200 + 200"
#         echo "idx range is ($start, $end)"
#         python -m dataset_adapter.visualization.gnd_vis_tool \
#             --car_csv_pn /home/shenhuahu/data/M1_20190909/car_status_20190909_data_num_1.csv \
#             --obs_csv_pn /home/shenhuahu/data/M1_20190909/obstacles_20190909_data_num_1_tracked.csv \
#             --out_vid_path /home/shenhuahu/tdt/tmp/idx_${start}_${end}.mp4 \
#             --data_filter "(1, 20190909, 0, 0, 1)" \
#             --first_person_perspective true \
#             --refresh true \
#             --data_index_range "($start, $end)"
#         echo >&1000
#     } &
# done
# wait
