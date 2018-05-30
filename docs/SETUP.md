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

# Import images
```bash
/home/omero/OMERO.server/bin/omero import 007.tiff -d 51
```
`-d, DATASET_ID`