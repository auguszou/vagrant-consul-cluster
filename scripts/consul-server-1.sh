host=192.168.2.10
join_hosts='["192.168.2.10", "192.168.2.20", "192.168.2.30"]'
SHARED_PATH=/vagrant/

sed -i "s/\"bootstrap\"\:.*$/\"bootstrap\"\: true,/g" /etc/consul.d/config.json
sed -i "s/\"bind_addr\"\:.*$/\"bind_addr\"\: \"${host}\",/g" /etc/consul.d/config.json
sed -i "s/\"client_addr\"\:.*$/\"client_addr\"\: \"${host}\"/g" /etc/consul.d/config.json
sed -i "/\"start_join\"\:.*$/d" /etc/consul.d/config.json
nohup consul agent -config-file=/etc/consul.d/config.json 2>&1 > /var/consul/consul-run.log &

sleep 2
