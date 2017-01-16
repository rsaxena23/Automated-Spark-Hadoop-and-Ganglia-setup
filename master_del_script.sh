#!/bin/bash

function Del_All()
{

source demo-openrc.sh

count=0

NUM=$1

while [ $count -lt $NUM ]; do
 echo 'deleting'

IUD=`nova list |sed -n "/slave$count/p" | cut -d" " -f 2`

curl -X DELETE --header "Accept: application/json" --header "username: admin_team1" --header "password: jedimindtricks" "http://transcirrus-1.oscar.priv:6969/v1.0/ccc4bd3570d14bc2a19cda28ccc1d34a/instances/$IUD"
#nova delete $IUD
#echo 'ID:'$IUD

((count++))
done

}

#Del_All 

sudo ssh -tt 10.23.1.2 -l team1 "$(typeset -f);Del_All $1"
