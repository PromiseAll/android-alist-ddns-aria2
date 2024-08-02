#!/system/bin/sh

bin_path="/data/alist-ddns-go/bin"
aria2_version_path="/data/alist-ddns-go/aria2/version/version.txt"
aria2_data_path="/data/alist-ddns-go/aria2"
aria2_log_module="/data/alist-ddns-go/logs/aria2-module.log"
aria2_log_run="/data/alist-ddns-go/logs/aria2-run.log"

export PATH=${bin_path}:${PATH}

log(){
    echo "`TZ=Asia/Shanghai date "+%Y/%m/%d %H:%M:%S"` $1" >> ${aria2_log_module}
}

update_aria2(){

}

start_aria2(){
    log "info: 启动aria2"
    ${aria2_data_path}/bin/aria2c --conf-path=${aria2_data_path}/config/aria2.conf -D >> ${aria2_log_run} 2>&1
}

stop_aria2(){
    log "info: 已停止aria2"
    kill -9 $(pgrep aria2c)
}

while getopts ":sku" signal; do
    case ${signal} in
        s)
            start_aria2
            ;;
        k)
            stop_aria2
            ;;
        u)
            update_aria2
            ;;
        ?)
            echo ""
            ;;
    esac
done
