# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.define "ansible" do |ans|
    ans.vm.box = "ubuntu/xenial64"
    ans.vm.hostname = "ansible"
    ans.vm.provider "virtualbox" do |v|
       v.memory = 1024
       v.cpus = 1
    end
    ans.vm.provision :shell, :path => "provisioning/ansible.sh"
  end
end
