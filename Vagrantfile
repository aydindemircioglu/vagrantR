# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "ubuntu-yakkety"
	
	config.vm.box_url = "https://cloud-images.ubuntu.com/yakkety/current/yakkety-server-cloudimg-amd64-vagrant.box"
	
	config.vm.provider "virtualbox" do |vb|
		vb.customize ["modifyvm", :id, "--memory", "4096"]
	end
	config.vm.provision :shell, :path => "bootstrap.sh"
	config.vm.network :forwarded_port, host: 4567, guest: 80
end

