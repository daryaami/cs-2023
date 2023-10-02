#!/bin/bash

a=$1
b=$2
sum=$(($a+$b))
dif=$(($a-$b))
mult=$(($a*$b))
if [[ $b -eq 0 ]]
then
	div="#"
else
	div=`echo "scale=2; $a/$b"| bc`
fi
echo "$sum $dif $mult $div"

