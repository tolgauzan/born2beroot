#!/bin/bash

BANNER="
	   (                   )   )                       )
	 ( )\      (        ( /(( /(    (  (            ( /(
	 )((_)  (  )(   (   )(_))\())  ))\ )(   (    (  )\())
	((_)_   )\(()\  )\ |(_)((_)\  /((_|()\  )\   )\(_))/
	 | _ ) ((_)((_)_(_/(_  ) |(_)(_))  ((_)((_) ((_) |_
	 | _ \/ _ \ '_| ' \)) /| '_ \/ -_)| '_/ _ \/ _ \  _|
	 |___/\___/_| |_||_/___|_.__/\___||_| \___/\___/\__|
"
#İşletim sistemi mimarisi kernel versiyon 
ARCHITECTURE=$(uname -a | sed 's/ PREEMPT_DYNAMIC//')

#Fiziksel cpu
PHYSICAL_CPU_NB=$(lscpu | grep "CPU(s)" | awk '{print $2}' | head -n 1)

#Sanal Cpu
VIRTUAL_CPU_NB=$(nproc)

# RAM kullanım durumu
MEMORY_INFO=$(free -m | grep Mem)
TOTAL_RAM=$(echo $MEMORY_INFO | awk '{print $2}') # Toplam RAM
USED_RAM=$(echo $MEMORY_INFO | awk '{print $3}') # Kullanılan RAM
RAM_USAGE=$(echo "scale=2; $USED_RAM/$TOTAL_RAM*100" | bc)

# Disk kullanım durumu
DISK_INFO=$(df -h | grep '^/dev')
DISK_TOTAL=$(echo $DISK_INFO | awk '{print $2}')
DISK_USED=$(echo $DISK_INFO | awk '{print $3}')
DISK_USAGE=$(echo $DISK_INFO | awk '{print $5}')

# CPU yük durumu
CPU_LOAD=$(cat /proc/loadavg | awk '{print $1}')

# Son yeniden başlatma zamanı
LAST_BOOT=$(who -b | awk '{print $3, $4}')

# LVM kullanım durumu
LVM_STATUS=$(if [ $(lsblk | grep "lvm" | wc -l) -eq 0 ]; then echo no; else echo yes; fi)

# Aktif bağlantı sayısı
TCP_CONNECTIONS=$(netstat -an | grep ESTABLISHED | wc -l)

# Sunucuyu kullanan kullanıcı sayısı
CONNECTED_USERS=$(who | wc -l)

# IPv4 ve MAC adresi
IP_ADDRESS=$(hostname -I | awk '{print $1}')
MAC_ADDRESS=$(ip link | grep "ether" | awk '{print $2}')

# Sudo komut sayısı
SUDO_COMMANDS_COUNT=$(cat /var/log/sudo/sudo.log | grep "COMMAND" | wc -l)

# Her şeyin yazdırılması
wall -n "
$BANNER
	#Architecture	:	$ARCHITECTURE
	#CPU physical	:	$PHYSICAL_CPU_NB
	#vCPU		:	$VIRTUAL_CPU_NB
	#Memory Usage	:	$USED_RAM/$TOTAL_RAM ($RAM_USAGE%)
	#Disk Usage	:	$DISK_USED/$DISK_TOTAL ($DISK_USAGE)
	#CPU load	:	$CPU_LOAD
	#Last boot	:	$LAST_BOOT
	#LVM use	:	$LVM_STATUS
	#Connections TCP:	$TCP_CONNECTIONS ESTABLISHED
	#User log	:	$CONNECTED_USERS
	#Network	:	$IP_ADDRESS ($MAC_ADDRESS)
	#Sudo		:	$SUDO_COMMANDS_COUNT cmd"

