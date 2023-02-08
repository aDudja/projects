function color_info {
	c1b=$(get_color_config "0")
	c1f=$(get_color_config "1")
	c2b=$(get_color_config "2")
	c2f=$(get_color_config "3")
	echo -e "\nColumn 1 background = $c1b 
Column 1 font color = $c1f 
Column 2 background = $c2b 
Column 2 font color = $c2f"
}
