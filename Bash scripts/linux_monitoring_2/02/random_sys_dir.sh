function get_sys_dir {
	nsysdirs=`ls -l / | grep "^d" | wc -l`
	rnd=`random "2" "$nsysdirs"`
	echo `find / -maxdepth 1 -type d | sed -n ${rnd}p`
}
