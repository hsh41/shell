#!/bin/bash

# ./script.sh compile
# rm ./infer_results/*
# ./script.sh infer
ssh -t pirate03 << eeooff
    rm -r /home/shenhuahu/data/M1_20190909/infer_results
    scp -r penghong:/mnt/cephfs-adas-boschhwy/smartauto/users/shenhua.hu/inference_code/infer_results /home/shenhuahu/data/M1_20190909/
    python /home/shenhuahu/gnd/pandar_process/src/lidar_infer_cluster/second_infer_cluster/output_kitti2velodyne.py \
            /home/shenhuahu/data/M1_20190909/infer_results/ \
            /home/shenhuahu/data/M1_20190909/infer_results/
    exit
eeooff
