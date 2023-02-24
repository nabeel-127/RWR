#!/bin/bash

DSP_PROG="./Debug/csmuah_V0.68"
INPUT_FOLDER_NAME="./input_0.68"
OUTPUT_FOLDER_NAME="./output_0.68"

DSP_HEX_FILE_NAME="./output/debugLogFile.hex"




echo "Input  Folder: $INPUT_FOLDER_NAME"
echo "Output Folder: $OUTPUT_FOLDER_NAME"
for fileName in "$INPUT_FOLDER_NAME"/*
do
	fileExtension=${fileName:(-3)}
	if [ $fileExtension = "mat" ]
	then

		matFile=`basename $fileName`
		csvFile="$OUTPUT_FOLDER_NAME/${matFile:0:(-4)}.csv"
		dspFile="$OUTPUT_FOLDER_NAME/${matFile:0:(-4)}_dspReport.hex"


		echo "Running File: $matFile"
		echo "Output File : $csvFile"

		$DSP_PROG 0 1 $fileName $csvFile $DSP_HEX_FILE_NAME $dspFile


	else
		echo "Ignoring File: $fileName"
	fi

done