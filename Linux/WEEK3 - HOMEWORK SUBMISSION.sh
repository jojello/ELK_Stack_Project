#!/bin/bash 
awk '{print $1,$2,$5,$6}' $2_Dealer_schedule | grep "$1"
