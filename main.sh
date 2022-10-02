#!/usr/bin/env bash

# build a function that takes in a large file and returns rows and columns in the dataset, 

repeat() {
    for i in `seq 1 $1`; do
        echo $2
        
    done
}

repeat $1 $2