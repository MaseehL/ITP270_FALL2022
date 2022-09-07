#!/bin/bash
echo "Enter the subnet:"
read Subnet

if [ "$Subnet" == "" ]
then
echo "Enter the Subnet:"
echo "Syntax Example = ./ping_sweep.sh 10.1.112"
else

for IP in $(seq 1 254); do 
	ping -c 1 $Subnet.$IP | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> discoveredIPs.txt &
done
fi

cat discoveredIPs.txt | sort > discoveredIPs.txt

nmap -T4 -sV -A -iL discoveredIPs.txt -oN PortScansIPs.txt --append-output

exit
