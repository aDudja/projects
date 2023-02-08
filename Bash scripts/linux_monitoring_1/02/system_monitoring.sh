hostname=`hostname`
timezone="`timedatectl | awk 'NR==4 {print $3 " UTC " $5}' | grep -o '[a-zA-Z]\+\/[a-zA-Z]\+\sUTC\s[+-][0-9][0-9]' | sed 's/+0/+/g' | sed 's/-0/-/g'`"
user=`whoami`
os=`cat /proc/sys/kernel/{ostype,version} | tr "\n" " "`
date=`date +"%d %b %Y %H:%M:%S"`
uptime=`uptime -p`
uptime_sec=`uptime -p | awk '{print $2*3600+$4*60}'`
ip=`hostname -I | awk '{print $1}'`
mask=`ip a | grep $ip | awk '{print $2}' | grep -o '\/[0-9]\+'`
maskb=`ipcalc $mask | awk 'NR==1 {print $3$4}'`
gateway=`ip r | grep default | grep -o '[0-9]\+.[0-9]\+.[0-9]\+.[0-9]\+' | awk 'NR==1'`
ram_stat=`vmstat -s | awk 'NR==1 {printf "%.3f Gb", $1*1e-6}'`
ram_used=`vmstat -s | awk 'NR==2 {printf "%.3f Gb", $1*1e-6}'`
ram_free=`vmstat -s | awk 'NR==5 {printf "%.3f Gb", $1*1e-6}'`
space_root=`vmstat -s | awk 'NR==8 {printf "%.2f Mb", $1*0.001}'`
space_root_used=`vmstat -s | awk 'NR==9 {printf "%.2f Mb", $1*0.001}'`
space_root_free=`vmstat -s | awk 'NR==10 {printf "%.2f Mb", $1*0.001}'`

function system_monitoring {
echo "HOSTNAME: $hostname
TIMEZONE: $timezone
USER: $user
OS: $os
DATE: $date
UPTIME: $uptime
UPTIME_SEC: $uptime_sec sec
IP: $ip
MASK: $maskb
GATEWAY: $gateway
RAM_TOTAL: $ram_stat
RAM_USED: $ram_used
RAM_FREE: $ram_free
SPACE_ROOT: $space_root
SPACE_ROOT_USED: $space_root_used
SPACE_ROOT_FREE: $space_root_free"
}
