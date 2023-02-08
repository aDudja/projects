case $1 in
  1)
    sort -k2 -n access.log
    ;;

  2)
    awk '{print $1}' access.log | sort -u
    ;;

  3)
    awk '$2 ~ /^[45]/ {print $0}' access.log
    ;;

  4)
    awk '$2 ~ /^[45]/ {print $1}' access.log | sort -u
    ;;

  *)
    echo $msg
    ;;
esac
