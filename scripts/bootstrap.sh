apt-get install -y unzip

SHARED_PATH=/vagrant

unzip $SHARED_PATH/consul_1.0.1_linux_amd64.zip -d /usr/local/bin/
[ -d /etc/consul.d ] || mkdir -p /etc/consul.d
[ -d /var/consul ] || mkdir /var/consul
cp $1 $SHARED_PATH/config/consul-config.json /etc/consul.d/config.json


