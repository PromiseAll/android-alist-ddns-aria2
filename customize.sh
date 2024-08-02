DATAPATH="/data/alist-ddns-go"

mkdir ${DATAPATH}
mkdir ${DATAPATH}/alist
mkdir ${DATAPATH}/ddns-go
mkdir ${DATAPATH}/aria2
mkdir ${DATAPATH}/bin
mkdir ${DATAPATH}/crond

cp -R ${MODPATH}/alist ${DATAPATH}
cp -R ${MODPATH}/bin ${DATAPATH}
cp -R ${MODPATH}/ddns-go ${DATAPATH}
cp -R ${MODPATH}/aria2 ${DATAPATH}
cp -R ${MODPATH}/crond ${DATAPATH}

rm -rf ${MODPATH}/alist
rm -rf ${MODPATH}/aria2
rm -rf ${MODPATH}/ddns-go
rm -rf ${MODPATH}/bin
rm -rf ${MODPATH}/crond
