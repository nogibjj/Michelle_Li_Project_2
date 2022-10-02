#!/usr/bin/env bash

# build a function that takes in a large file and returns rows and columns in the dataset, 

function file_summary() {
    echo "*** Number of columns ***"
    head -1 $1 | sed 's/[^,]//g' | wc -c
    echo "*** Number of rows ***"
    cat $1 | wc -l
    echo "*** First 3 rows ***"
    cat $1 | head -3
    echo "*** How many unique ratings are there? ***"
    cat $1 | awk -F ',' '{print $1}' | sort | uniq -c | wc -l
    echo "*** What is the average rating? ***"
    awk '{ total += $1; count++ } END { print total/count }' $1
}

file_summary $1