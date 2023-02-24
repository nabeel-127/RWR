#!/bin/bash

DSP_PROG="./Release/csmuah_V0.91"
CPU_PROG="./Release/csmuah_V0.91"

PFA_PROG="PFA_V5.02.jar"
PFA_PROG_DIR="extras/PFA_V5.02/"

#DSP_MAT_FILE_NAME="input/MultipleDAsFMRTest_AllBands_126001to127000pages.mat"
#DSP_MAT_FILE_NAME="input/130508_Flt1_of_1_2100_2600secs.mat"
DSP_MAT_FILE_NAME="input/Data409.bin.mat"
#DSP_MAT_FILE_NAME="input/Jan13Filtered.mat"
#DSP_MAT_FILE_NAME="input/MultipleDAsFMRTest_AllBands_126001to127000pages.mat"
#DSP_MAT_FILE_NAME="input/8thMay201376001to77000pages.mat"

DSP_HEX_FILE_NAME="output/debugLogFile.hex"
DSP_CSV_FILE_NAME="output/lowReport.csv"
DSP_REP_FILE_NAME="output/dspReport.hex"
DSP_SIM_FLAG="1"

CUR_DIR=$(pwd)

echo "Running DSP"

$DSP_PROG 0 1 $DSP_MAT_FILE_NAME $DSP_CSV_FILE_NAME $DSP_HEX_FILE_NAME $DSP_REP_FILE_NAME

#rm output/flightRecordHigh.fre
#rm output/flightRecordLow.fre

echo "Running CPU"

$CPU_PROG 1 1 $DSP_REP_FILE_NAME

#trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

cd $PFA_PROG_DIR

java -jar $PFA_PROG ../../output/flightRecordHigh.fre ../../input/ &
#java -jar $PFA_PROG ../../output/flightRecordLow.fre ../../input/ &
cd $CUR_DIR


while $(read -r -n1 key)
do
	kill -9 $(jobs -p)
	break;
done
