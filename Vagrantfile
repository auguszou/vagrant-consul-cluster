# -*- mode: ruby -*-
# vi: set ft=ruby :

guest_os = "ubuntu/xenial64"

nodes = [
  { :hostname => 'consul1', :ram => 512, :ip => '192.168.2.10', :roles => ['consul-server-1']},
  { :hostname => 'consul2', :ram => 512, :ip => '192.168.2.20', :roles => ['consul-server-2']},
  { :hostname => 'consul3', :ram => 512, :ip => '192.168.2.30', :roles => ['consul-server-3']},
  { :hostname => 'client', :ram => 512, :ip => '192.168.2.100', :roles => ['consul-client']},
]

Vagrant.configure("2") do |config|
  config.vm.box_check_update = false
  config.vbguest.auto_update = false

  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = guest_os
      nodeconfig.vm.hostname = node[:hostname]
      nodeconfig.vm.network "private_network", ip: node[:ip]

      config.vm.synced_folder ".", "/vagrant"
      config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.name = node[:hostname]
        vb.check_guest_additions = false
        vb.memory = node[:ram]
      end

      nodeconfig.vm.provision "shell", privileged: true, path: "scripts/bootstrap.sh"

      node[:roles].each do |role|
        nodeconfig.vm.provision :shell, privileged: true, path: "scripts/#{role}.sh"
      end

    end
  end
end
