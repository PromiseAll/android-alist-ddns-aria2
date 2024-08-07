#!/system/bin/sh

MODDIR=${0%/*}

# 定义日志文件的路径
DATAPATH="/data/alist-ddns-go"
LOGPATH="${DATAPATH}/logs"

bin_path="${DATAPATH}/bin"
export PATH=${bin_path}:${PATH}

mkdir -p ${LOGPATH}

> ${LOGPATH}/alist-module.log
> ${LOGPATH}/alist-run.log
> ${LOGPATH}/ddns-go-module.log
> ${LOGPATH}/ddns-go-run.log
> ${LOGPATH}/aria2-module.log
> ${LOGPATH}/aria2-run.log
> ${LOGPATH}/Alist.log

until [ $(getprop init.svc.bootanim) = "stopped" ] ; do
    sleep 5
done

chmod -R 6755 ${DATAPATH}/bin/curl
chmod -R 6755 ${DATAPATH}/bin/busybox
chmod -R 6755 ${DATAPATH}/bin/wget
chmod -R 6755 ${DATAPATH}/bin/jq
chmod -R 6755 ${DATAPATH}/alist/bin/alist
chmod -R 6755 ${DATAPATH}/alist/script/alist.tool
chmod -R 6755 ${DATAPATH}/ddns-go/bin/ddns-go
chmod -R 6755 ${DATAPATH}/ddns-go/script/ddns-go.tool
chmod -R 6755 ${DATAPATH}/aria2/bin/aria2c
chmod -R 6755 ${DATAPATH}/aria2/script/aria2.tool

crond -c ${DATAPATH}/crond

# 防止系统休眠
# echo "PowerManagerService.noSuspend" > /sys/power/wake_lock

${DATAPATH}/alist/script/alist.tool -s &
${DATAPATH}/ddns-go/script/ddns-go.tool -s &
${DATAPATH}/aria2/script/aria2.tool -s &
