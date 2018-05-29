# -*- mode: ruby -*-
# vi: set ft=ruby :

if ENV['GIGAOMERO_BOX'] == 'aws'
  box = "dummy"
  box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"
else
  box = "bento/centos-7.4"
  box_url = "https://app.vagrantup.com/bento/boxes/centos-7.4/versions/201803.24.0/providers/virtualbox.box"
end

Vagrant.configure(2) do |config|
  # Cache packages to reduce provisioning time
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.define 'gigaomero' do |gigaomero|
    gigaomero.vm.box = box
    gigaomero.vm.box_url = box_url
    # Forward ports from VM to host to allow outside computers to access VM
    gigaomero.vm.network "forwarded_port", guest: 80, host: 9170
    gigaomero.vm.network "forwarded_port", guest: 443, host: 9173
    gigaomero.vm.network "forwarded_port", guest: 4063, host: 4063
    gigaomero.vm.network "forwarded_port", guest: 4064, host: 4064
    gigaomero.vm.network "forwarded_port", guest: 4080, host: 9171
    gigaomero.vm.network "forwarded_port", guest: 5432, host: 9172
    # Set up directories
    gigaomero.vm.synced_folder ".", "/vagrant", type: "virtualbox"

    ####################
    #### VirtualBox ####
    ####################
    gigaomero.vm.provider :virtualbox do |vb|
      vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate//vagrant","1"]
    end

    #############
    #### AWS ####
    #############
    gigaomero.vm.provider :aws do |aws, override|
      aws.access_key_id = ENV['AWS_ACCESS_KEY_ID']
      aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
      aws.keypair_name = ENV['AWS_KEYPAIR_NAME']
      # aws.ami = "ami-1bfa2b78" # selinux disabled
      aws.ami = "ami-b85e86db" # selinux on
      aws.region = ENV['AWS_DEFAULT_REGION']
      aws.instance_type = "t2.micro"
      aws.tags = {
        'Name' => 'gigaomero-website',
        'Deployment' => 'test',
      }
      aws.security_groups = ENV['AWS_SECURITY_GROUPS']

      override.ssh.username = "centos"
      override.ssh.private_key_path = ENV['AWS_SSH_PRIVATE_KEY_PATH']
    end

    if ENV['GIGAOMERO_BOX'] != 'aws'
      gigaomero.vm.provision "shell", inline: "sudo hostnamectl set-hostname localhost"
      gigaomero.vm.provision "shell", path: "scripts/download-omero-data.sh"
      gigaomero.vm.provision "shell", path: "scripts/install-omero.sh"
      gigaomero.vm.provision "shell", path: "scripts/stop-omero.sh"
      gigaomero.vm.provision "shell", path: "scripts/restore-db.sh"
      gigaomero.vm.provision "shell", path: "scripts/restore-data.sh"
      gigaomero.vm.provision "shell", path: "scripts/start-omero.sh"
    end
  end
end