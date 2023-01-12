#! /bin/bash

bj=$(echo bonj)
architecture=$(uname -srvmo)
cpu_physical=$(grep 'physical id' /proc/cpuinfo | uniq | wc -l)
cpu_v=$(grep processor /proc/cpuinfo | uniq | wc -l)
mem_usage_pourcentage=$(free -m | grep Mem | awk '{printf("(%.2f%%)"), $3 / $2 * 100}')
disk_usage_pourcentage=$(df -h --total --block-size=MB | grep total | awk '{printf("(%.1f%%)"), $3 / $2 * 100}')
#disk_usage_pourcentage=$(df -k --total | grep total | awk '{print $5}')
cpu=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%\n"), $1 + $3}')
lst_boot=$(who -b | awk '{print $3 " "$4}')
lvm_use=$(if [$(lsblk | grep lvm | wc -l) -eq 0] ; then echo no; else echo yes; fi)
tcp=$(grep TCP /proc/net/sockstat | awk '{print $3}')



echo "#Architecture :" $architecture
echo "#CPU physical :" $cpu_physical
echo "#vCPU :" $cpu_v
echo "#Memory Usage :" $(free -m | grep Mem | awk '{print $3"/"$2,"MB"}') $mem_usage_pourcentage
echo "#Disk Usage :" $(df -h --total | grep total | awk '{print $3"/"$2}') $disk_usage_pourcentage
echo "#CPU load :" $cpu
echo "#Last boot :" $lst_boot
echo "#LVM use :" $lvm_use
echo "#Connections TCP :" $tcp
echo "#User log :" $(who | wc -l)
echo "#Network :" $(hostname -I) $(ip link | grep link/ether | awk '{print "("$2")"}')
echo "#Sudo :" $(grep COMMAND /var/log/sudo/sudo.log | wc -l) "cmd"
