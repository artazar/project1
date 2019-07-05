# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
cd /vagrant
bash provision.sh
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.provision "shell", inline: $script

end
