# Installation of OMERO on a Centos VM using Vagrant

In this setup, we are using a Centos 7.4 virtual machine to install an OMERO 
server and its web client.

Download the GigaOMERO repository from Github:
```bash
$ git clone https://github.com/gigascience/giga-omero.git
```

Change to the vagrant-omero-install branch:
```bash
$ cd giga-omero
$ git checkout vagrant-omero-install
```

Download the OMERO installation scripts from Github:
```bash
$ git submodule init
$ git submodule update
```

Finally, boot up the VM using Vagrant 
[2.0.1](https://releases.hashicorp.com/vagrant/2.0.1/) which will also execute 
the OMERO installation steps:
```bash
$ vagrant up
```

The OMERO server should now deployed on the Centos VM with the website available
at [http://localhost:9170](http://localhost:9170) from a web browser. To log 
into the OMERO system from the web client, use `root` and `omero_root_password`.

# Install OMERO on AWS

## Preparation

An AWS user account is required to launch an EC2 instance deployed with GigaDB. 
Vagrant needs to be able to access the AWS user account's security credentials 
using the following environment variables:
```bash
AWS_ACCESS_KEY_ID="Access key for accessing AWS"
AWS_SECRET_ACCESS_KEY="Secret access key for accessing AWS"
AWS_DEFAULT_REGION="The region to start the instance in"
AWS_KEYPAIR_NAME="Name of keypair used to bootstrap AMIs"
AWS_SECURITY_GROUPS="Name of AWS security group to use"
AWS_SSH_PRIVATE_KEY_PATH="Path to AWS private key"
AWS_KEYPAIR_NAME="Name of keypair used to bootstrap AMIs"
```

The above environment variables can be set and managed in your `~/.bash_profile`
file.

Also in your `~/.bash_profile` file, the `GIGAOMERO_BOX` env variable needs to 
be set to aws as follows:
```bash
export GIGAOMERO_BOX='aws'
```

Once these additions have been made then ~/.bash_profile should be sourced to 
load the AWS variables into your environment:
```bash 
$ source ~/.bash_profile
```

In order for Vagrant to control and provision machines hosted on EC2 instances, 
the AWS provider plugin for Vagrant needs to be installed:
```bash
$ vagrant plugin install vagrant-aws
```

GigaOMERO can then be deployed onto the AWS cloud by issuing the command below:
```bash
$ vagrant up --provider=aws
```

# Import images
```bash
$ /home/omero/OMERO.server/bin/omero import 007.tiff -d DATASET_ID
```