#!/bin/bash
#############################################################################
# Submit K8S jobs for LIDAR perception inference
#
#    This script will submit LIDAR perception jobs to the GPU cluster to
#    and perform LIDAR inference on all rosbag files collected at one MAP_ID
#    and DATE.
#
# Author: shuangquan.sun; jingchu.liu, shenhua.hu
# Date: Nov 2019
# Horizon Robotics, Inc.
#############################################################################
# Treat unset vars as ERROR
set -u

########################################################
# Custom settings
########################################################
# --------------------------------------------------
# Default parameters
MAP_ID=2
DATE=20190909
DATA_NUM=0
CENTRE_CAR_ID=0
DATA_VERSION=0
METHOD=fusion  # odom method: gnss or fusion
#--------------------------------------------------
# File path locations
LOCAL_PATH=/home/shenhuahu/data/tmp
HDFS_PATH=hdfs://hobot-bigdata-aliyun/user/penghong.lin/tdt
# work space should be in the root directory of `gnd-platform-data-processing`
WORKSPACE_PATH=/home/shenhuahu/gnd
#--------------------------------------------------
# Local python executables
# System python2.7 package installation directory
# Additional installed python2.7 package directory
# The directory where the relevant packages for ros are installed
# export PYTHONPATH=${WORKSPACE_PATH}:${PATH}

########################################################
# Start processing
########################################################
echo "#############################"
echo "processing: DATE=${DATE}"
echo "#############################"
cd ${WORKSPACE_PATH}

date_s=`date +%Y_%m_%d_%H_%M_%S` &&
echo "start time:${date_s}"


#--------------------------------------------------
# Convert rosbag to .bin files for lidar inference
echo "####### extract and convert pointcloud messages to .bin #######"
python -u -m pandar_process.src.tools.bag2bin \
    --input_dir ${LOCAL_PATH}/${DATE} \
    --out_dir ${LOCAL_PATH}/${DATE}/processed/velodyne
