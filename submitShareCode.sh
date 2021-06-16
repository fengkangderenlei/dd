#!/bin/sh
set -e

echo "清除非当日产生的日志，准备提交互助码码到助力池"
for dd_log in $(ls /data/logs/ | grep .log | grep jd_); do
    dt=$(date | awk '{print $2" "$3}')
    sed -i "/^${dt}.*/!d" "/data/logs/${dd_log}"
done
if [ 0.5 = "0.5" ];then
    ddBot -up commitShareCode
else
    echo "请更新至最新版docker镜像才能自动上传助力码到助力池"
fi
