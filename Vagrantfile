Vagrant.configure(2) do |config|
config.vm.provider "virtualbox" do |v|

  # You need this configuration if you want a private network with NAT. In this case you must uncomment lines below
  #v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  #v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  # Uncomment line below to assign 2 cpu to your VM
  #v.cpus = 2
end

$script = <<-SCRIPT
echo I am provisioning...
date > /etc/vagrant_provisioned_at
sudo apt-get update -y
SCRIPT

$script_software = <<-SCRIPT
sudo apt-get install -y gcc libpcre3-dev zlib1g-dev libpcap-dev openssl libssl-dev libnghttp2-dev libdumbnet-dev bison flex libdnet nano
SCRIPT


 config.vm.define "snort" do |snort|

  # I've choiced an Ubuntu box, you can choice what you want.
  #snort.vm.box = "bento/centos-7.4"
  snort.vm.box = "ubuntu/xenial64"

  # Uncomment line below to run this VM with private ip address
  #snort.vm.network "private_network" , ip:"192.168.0.101"
  # In lines below you can choose if you want to use DHCP or STATIC IP
  snort.vm.network "public_network" , use_dhcp_assigned_default_route: true #ip:"xxx.xxx.xxx.xxx"
  snort.vm.hostname = "snort"

  # Running $script
  snort.vm.provision "shell" , inline: $script

  # Running $script_software
  snort.vm.provision "shell" , inline: $script_software

  # Upload file snort.con from host to VM
  snort.vm.provision "file", source: "snort.conf", destination: "/tmp/snort.conf"

  # Running script.sh (in same folder of Vagrant project)
  snort.vm.provision "shell", path: "script.sh"

  # If you need, you can enable port forwarding
  #snort.vm.network "forwarded_port", guest: 80, host: 8080
  
end
end

