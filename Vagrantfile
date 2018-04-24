Vagrant.configure(2) do |config|
config.vm.provider "virtualbox" do |v|
  v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  #Posso assegnare 2 cpu ad ogni VM
  #v.cpus = 2
end

$script = <<-SCRIPT
echo I am provisioning...
date > /etc/vagrant_provisioned_at
sudo apt-get update -y
SCRIPT
#$script_ansible = <<-SCRIPT
#sudo yum -y install ansible nano
#SCRIPT
$script_software = <<-SCRIPT
sudo apt-get install -y gcc libpcre3-dev zlib1g-dev libpcap-dev openssl libssl-dev libnghttp2-dev libdumbnet-dev bison flex libdnet nano

SCRIPT
 config.vm.define "snort" do |snort|
  #snort.vm.box = "bento/centos-7.4"
  snort.vm.box = "ubuntu/xenial64"
  snort.vm.network "private_network" , ip:"192.168.0.101"
  snort.vm.hostname = "snort"
  snort.vm.provision "shell" , inline: $script 
  snort.vm.provision "shell" , inline: $script_software 
  snort.vm.network "forwarded_port", guest: 80, host: 8080
end
end

