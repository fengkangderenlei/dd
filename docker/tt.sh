
if [ -z $FRUITSHARECODES ]; then
shareCodes=""    
for line in $(cat /data/logs/sharecodeCollection.log | grep 东东农场 | sed s/[[:space:]]//g); do
        #echo ${line}
        #cat /data/logs/sharecodeCollection.log | grep 东东农场 | grep -v "$line"
        if [[ -z "${shareCodes}" || "${shareCodes}" == "" ]];then
           shareCodes=$(cat /data/logs/sharecodeCollection.log | grep 东东农场 | sed s/[[:space:]]//g | grep -v "${line}" | sed -n "s/.*互助码】\(.*\)$/\1/p" | tr -s "\n" "@"| sed "s/@$//")
        else
shareCodes=${shareCodes}"&"$(cat /data/logs/sharecodeCollection.log | grep 东东农场 | sed s/[[:space:]]//g | grep -v "${line}" | sed -n "s/.*互助码】\(.*\)$/\1/p" | tr -s "\n" "@"| sed "s/@$//")	
	fi 
	echo $shareCodes
	#echo \n
    done
fi
