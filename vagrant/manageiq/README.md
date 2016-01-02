# manageiq-vagrantdev
Vagrant file to  create a Vagrant environment

#Why use Vagrant:#

 

Vagrant allows to generate development environments that are consistent and automatic. It also allows to publish ports to your host so you don't need to know the IP address of the VM, and to synchronize content.

In particular, developing for ManageIQ has some nuances:

- Postgresql version has to be 9.2 or 9.3. Fedora 22 comes with Postgres 9.4 so it does not work.

- There are some additional steps to be done that depends on the OS, and that would be different in development than on production.

 
#Prerequisites:#

This has been done in a Fedora 22 workstation, it should work in any upper version, if Vagrant is compatible. It uses centos/7 base image.

In order to use some commands, you need to be inside the VM and the sync, or install rbenv in your development environment.

You need to have cloned the git repo in your worksation, and configure your Vagrantfile accordingly so it copies the proper version

 
#Steps:#

 
##1. Install Vagrant##
```
# dnf install -y vagrant vagrant-libvirt  
```
 
##2. Download Vagrant image##

Go to workspace/developer-manageiq or the place you want to create the VM

Download the Vagrant image for libvirt there
```
$vagrant init centos/7; vagrant up --provider libvirt  
```
 

Now you have a vagrant image installed named centos/7 and a Vagrant file.
```
Note: this should not be necessary as it is specified in the Vagrantfile
```
 
##3. Vagrantfile is now there, so let's modify it:##

You should have a line stating:

```
  config.vm.box = "centos/7"  
```

Let's change into something better (but reduced to not waste too much memory:
```
      config.vm.box = "centos/7"  
      
      config.vm.hostname="manageiq-devel"  
      
      config.vm.provider "libvirt" do |libvirt|  
        libvirt.driver="kvm"  
        libvirt.memory=3072  
        libvirt.cpus=2  
      end  
```
 

 

Let's modify some other things so the rails port is copied to the host:
```
    config.vm.network "forwarded_port", guest: 3000, host:3000, auto_correct: true  
```
 

And then configure the VM. There are two steps, the first one will install the software in the  box, the second one will configure postgresql and make things work:
```
      # Configure where your git repo where your code is:  
      config.vm.synced_folder "../manageiq", "/home/vagrant/manageiq"  
      config.vm.provision :shell, :path => "install_os.sh"  
      config.vm.provision :shell, :path => "manageiq_dev.sh", :privileged => false  
```
 
#5. Run it#
```
    $ vagrant up  
```
 
Interesting staff:

You can connect to 127.0.0.1:3000 to see the appliance running in your browser (localhost)

You can connect to the VM using SSH:
```
$ vagrant ssh  
```
You can synchronize your development environment using this command:

```
$ vagrant rsync  
```
_NOTE:_ rsync will copy from the host to the VM, so you need to copy again config files to make it work properly

If you use VirtualBox, it should be done automatically (but you need to install VBoxTools in the VM, you can also automate the synchronization, although it is not recommended in the documetation as it can give errors if you stop the VM outside of Vagrant


#TODO:#

Share the files via NFS so there is no need to Rsync.
