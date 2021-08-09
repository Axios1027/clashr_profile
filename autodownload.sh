cp /root/.config/clash/config.yaml /root/.config/clash/config.yaml.bak #备份文件
wget http://short.axios.cdmetrokyb.com/clash_autodownload -O /root/.config/clash/configdownload.yaml #下载新的config文件

filename=/root/.config/clash/configdownload.yaml
filesize=`ls -l $filename | awk '{ print $5 }'`
size=$((1024))

if [ $filesize -gt $size ]
then
    echo "文件下载成功"
    cp /root/.config/clash/configdownload.yaml /root/.config/clash/config.yaml
else 
    echo "文件下载失败，恢复备份文件"
    cp root/.config/clash/config.yaml.bak root/.config/clash/config.yaml
fi

pm2 restart clash