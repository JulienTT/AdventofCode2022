#!/bin/bash

cat input | awk 'BEGIN{max=-1} $1>0 {m+=$1} $1~/^$/ {if(m>max) {max=m};m=0} END{print max}'

cat input | awk '
BEGIN{count=0} $1>0 {m+=$1} 
$1~/^$/ {value[count]=m;count+=1;m=0} 
END{
	value[count]=m;
	count+=1;
	m=0;
	n=asort(value); 
	total=0; 
	for (i=0;i<=2;i++) {print total+=value[n-i]}; 
	print total}' 

