#!/bin/bash

########################################################################
#                                                                      #
# Copyright(C) 2019 - LBS - (Single person developer.)                 #
# Thu May 30 00:09:30 JST 2019                                         #
# Autor: Leonid Burmistrov                                             #
#                                                                      #
# File description:                                                    #
#                                                                      #
# Input paramete:                                                      #
#                                                                      #
# This software is provided "as is" without any warranty.              #
#                                                                      #
########################################################################

LC_TIME=en_US.UTF-8

source /home/burmist/root_v6.14.00/root-6.14.00-install/bin/thisroot.sh

function gitHistoryTree_bash {
    rm -rf $outDataFile
    rm -rf $outShortDataFile
    rm -rf $outRootFile
    rm -rf $outShortUtDataFile
    git log --graph > $outDataFile
    grep Date $outDataFile | awk '{print (NF-7)" "$(NF-4)" "$(NF-3)" "$(NF-2)" "$(NF-1)}' > $outShortDataFile
    while read -r l1 l2 l3 l4 l5;
    do
	ut=`(date -d "$l2 $l3 $l4 $l5" +%s)`
	echo $ut $l1 >> $outShortUtDataFile
    done < $outShortDataFile
} 

function printHelp {
    echo " --> ERROR in input arguments "
    echo " [0] -d  : default"
    echo " [0] -p2 : other"
    echo " [0] -h  : print help"
}

sourceHome="./"
dataFolder=$sourceHome'gitHistoryTreeData/'
outDataFile=$dataFolder'gitHistoryTree.dat'
outShortDataFile=$dataFolder'gitHistoryTreeShort.dat'
outShortUtDataFile=$dataFolder'gitHistoryTreeShortUt.dat'
outRootFile=$dataFolder$outShortDataFile'.root'
mkdir -p $dataFolder

if [ $# -eq 0 ] 
then    
    printHelp
else
    if [ "$1" = "-d" ]; then
	gitHistoryTree_bash
    elif [ "$1" = "-p2" ]; then
            printHelp
    elif [ "$1" = "-h" ]; then
        printHelp
    else
        printHelp
    fi
fi

#espeak "I have done"
