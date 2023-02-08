function random {
	echo $(($1 + RANDOM % $2))	
}
