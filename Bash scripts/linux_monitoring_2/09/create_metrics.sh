while true
do
    sleep 3
    CPU="s21_process_cpu_seconds_total $(mpstat | grep 'all' | awk '{print $3}')"
    MEMTOT="s21_node_memory_MemTotal_bytes $(free -b | grep 'Mem:' | awk '{print $2}')"
    MEMFREE="s21_node_memory_MemFree_bytes $(free -b | grep 'Mem:' | awk '{print $4}')"
    MEMBUF="s21_node_memory_Buffers_bytes $(free -b | grep 'Mem:' | awk '{print $6}')"
    MEMAVA="s21_node_memory_MemAvailable_bytes $(free -b | grep 'Mem:' | awk '{print $7}')"
    HARDAVAVAL=`df | grep "/dev/sda2" | awk '{print $4}'`
    HARDAVAKEY='s21_node_filesystem_avail_bytes'
    HARDTOTVAL=`df | grep "/dev/sda2" | awk '{print $2}'`
    HARDTOTKEY='s21_node_filesystem_size_bytes'
    echo -e "${CPU}\n${MEMTOT}\n${MEMFREE}\n${MEMBUF}\n${MEMAVA}\n${HARDAVAKEY} ${HARDAVAVAL}000\n${HARDTOTKEY} ${HARDTOTVAL}000" > /var/www/node-exporter-custom/metrics.txt
done
