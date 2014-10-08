#!/bin/bash

datetime=`date +%d-%m-%Yat_%H`
declare -a indices_arr=('demo' 'products' 'conceptnet_data')

esdump --url http://10.0.0.203:9200/ --indexes  ${indices_arr[*]}  --bzip2 --file indices_${datetime}.bz2

