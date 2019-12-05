#!/bin/bash

while true
do
    echo pid $$ $(ps aux | grep $USER | wc -l)
    ./zad3.sh
done