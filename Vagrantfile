# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-7.4"

  # Forward ports from VM to host to allow outside computers to access VM
  config.vm.network "forwarded_port", guest: 80, host: 9170
  config.vm.network "forwarded_port", guest: 4080, host: 9171
  config.vm.network "forwarded_port", guest: 5432, host: 9172
  config.vm.network "forwarded_port", guest: 443, host: 9173
  config.vm.network "forwarded_port", guest: 4063, host: 4063
  config.vm.network "forwarded_port", guest: 4064, host: 4064

  # Set up directories
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  # Cache packages to reduce provisioning time
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  ####################
  #### VirtualBox ####
  ####################
  config.vm.provider :virtualbox do |vb|
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate//vagrant","1"]
  end

  config.vm.provision "shell", path: "install-omero.sh"
end