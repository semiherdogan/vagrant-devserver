# -*- mode: ruby -*-
# vi: set ft=ruby :

# confDir = $confDir ||= File.expand_path(File.dirname(__FILE__))

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 443, host: 44300, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 3306, host: 3306, host_ip: "127.0.0.1" # mysql
  config.vm.network "forwarded_port", guest: 27017, host: 27017, host_ip: "127.0.0.1" # mongodb
  config.vm.network "forwarded_port", guest: 6379, host: 6379, host_ip: "127.0.0.1" # redis
  config.vm.network "forwarded_port", guest: 11211, host: 11211, host_ip: "127.0.0.1" # memcached
  config.vm.usable_port_range = 3000..3010

  config.vm.network "private_network", ip: "192.168.20.20"

  config.vm.synced_folder "www/", "/home/vagrant/www"
  config.vm.synced_folder "conf/", "/home/vagrant/conf"
  config.vm.synced_folder "scripts/", "/home/vagrant/scripts"
  config.vm.synced_folder "sites-enabled/", "/home/vagrant/sites-enabled"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = "2"
    #vb.customize ["modifyvm", :id, "--memory", "2048", "--cpus", "2"]
  end

  # config.vm.provision "shell", path: "scripts/sync_config_files.sh"

  # config.trigger.before :up do |trigger|
  #   trigger.info = "Running a before up trigger!"
  # end
end
