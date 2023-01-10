#! /bin/bash

bj=$(echo bonj)
architecture=$(uname -srvmo)
cpu_physical=$(grep 'physical id' /proc/cpuinfo | uniq | w>
cpu_v=$(grep processor /proc/cpuinfo | uniq | wc -l)
mem_usage_pourcentage=$(free -m | grep Mem | awk '{printf(>
disk_usage_pourcentage=$(df -h --total --block-size=MB | g>

echo "#Architecture :" $architecture
echo "#CPU physical :" $cpu_physical
echo "#vCPU :" $cpu_v
echo "#Memory Usage :" $(free -m | grep Mem | awk '{print >
echo "#Disk Usage :" $(df -h --total | grep total | awk '{>
echo "#CPU load :" $()
echo "#Last boot :" $()
echo "#LVM use :" $()
echo "#Connections TCP :" $()
echo "#User log :" $()
echo "#Network :" $()
echo "#Sudo :" $()
