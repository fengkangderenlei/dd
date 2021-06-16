

dt=$(date | awk '{print $2" "$3}')
sed -i "/^$dt.*/!d" "tt2.log"
