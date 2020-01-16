cat << EOF >> /etc/supervisord.conf
[program:queue]
command=bash /usr/local/bin/send_queues.sh
EOF
wget https://raw.githubusercontent.com/gunnytian/kerio/master/scripts/send_queues.sh -O /usr/local/bin/send_queues.sh
echo "Nhap URL"
read URL
sed -i 's/URL=nhanhoa.com/URL='$URL'/g' /usr/local/bin/send_queues.sh
echo "Nhap ip"
read IP
sed -i 's/IP=8.8.8.8/IP='$IP'/g' /usr/local/bin/send_queues.sh
chmod 777 /usr/local/bin/send_queues.sh
chmod +x /usr/local/bin/send_queues.sh
/etc/init.d/supervisord start
chkconfig supervisord on
ln -f -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
