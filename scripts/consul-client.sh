host=192.168.2.100
join_hosts='["192.168.2.10", "192.168.2.20", "192.168.2.30"]'
SHARED_PATH=/vagrant/

sed -i "s/\"server\"\:.*$/\"server\"\: false,/g" /etc/consul.d/config.json
sed -i "s/\"bind_addr\"\:.*$/\"bind_addr\"\: \"${host}\",/g" /etc/consul.d/config.json
sed -i "/\"client_addr\"\:.*$/d" /etc/consul.d/config.json

nohup consul agent -ui -config-dir /etc/consul.d/config.json 2>&1 > /dev/null &

sleep 2
