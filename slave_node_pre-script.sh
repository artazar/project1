!#/bin/bash

USER=jenkins
sudo apt-get install docker docker-compose -y
wget https://releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.deb
sudo install ./vagrant_2.2.5_x86_64.deb -y
sudo apt-get install virtualbox -y
sudo adduser --system --home /home/${USER} --shell /bin/bash --ingroup docker ${USER}
sudo mkdir -p /home/${USER}/.ssh/
sudo chown ${USER} /home/${USER}/.ssh
sudo echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE3Xoaz78I7AmvoJkUiydOzifTduCX8Secp0iWokJLBx' >> /home/${USER}/.ssh/authorized_keys
sudo chown ${USER} /home/${USER}/.ssh/authorized_keys
