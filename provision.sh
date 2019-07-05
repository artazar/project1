#!/bin/bash

init_user() {
	user="$(id -un 2>/dev/null || true)"
        sh_c='sh -c'
        if [ "$user" != 'root' ]; then
                if command_exists sudo; then
                        sh_c='sudo -E sh -c'
                elif command_exists su; then
                        sh_c='su -c'
                else
                        echo "Error: this installer needs the ability to run commands as root."
                        echo "We are unable to find either "sudo" or "su" available to make this happen."
                        exit 1
                fi
        fi
}

install_docker() {
	if ! docker --version > /dev/null; then
		curl -fsSL https://get.docker.com -o get-docker.sh
		sh get-docker.sh
		rm -f get-docker.sh
	fi
}

get_services() {
        echo $(pwd)
	$sh_c "cp -f ./systemd/stub.service /etc/systemd/system/stub.service"
	$sh_c "chmod +x /etc/systemd/system/stub.service"
}

enable_services() {
	$sh_c "systemctl daemon-reload"
	$sh_c "systemctl enable stub.service"
	$sh_c "systemctl start stub.service"
}

do_install() {
	init_user
	install_docker
	get_services
	enable_services
}

do_install
