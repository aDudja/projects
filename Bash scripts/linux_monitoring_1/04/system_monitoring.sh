FONT_COLORS=("\033[0m" "\033[0;37m" "\033[0;31m" "\033[0;32m" "\033[0;34m" "\033[0;35m" "\033[0;30m")
BGR_COLORS=("\033[0m" "\033[47m" "\033[41m" "\033[42m" "\033[44m" "\033[45m" "\033[40m")
NORMAL='\033[0m'
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
echo -e "${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}HOSTNAME:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$hostname${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}TIMEZONE:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$timezone${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}USER:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$user${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}OS:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$os${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}DATE:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$date${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}UPTIME:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$uptime${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}UPTIME_SEC:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$uptime_sec sec${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}IP:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$ip${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}MASK:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$maskb${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}GATEWAY:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$gateway${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}RAM_TOTAL:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$ram_stat${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}RAM_USED:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$ram_used${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}RAM_FREE:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$ram_free${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}SPACE_ROOT:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$space_root${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}SPACE_ROOT_USED:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$space_root_used${NORMAL}
${FONT_COLORS[${user_config[1]}]}${BGR_COLORS[${user_config[0]}]}SPACE_ROOT_FREE:${NORMAL}${FONT_COLORS[${user_config[3]}]}${BGR_COLORS[${user_config[2]}]}$space_root_free${NORMAL}"
}
