# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "lasp/ubuntu16.04-desktop"
  config.ssh.insert_key = false

  config.vm.provider :virtualbox do |v|
    v.name = "virtualboxubuntu1604"
    v.memory = 4096
    v.cpus = 4
  end

  config.vm.hostname = "virtualboxubuntu1604"
  config.vm.network :private_network, ip: "172.16.3.80"

  # Set the name of the VM. See: http://stackoverflow.com/a/17864388/100134
  config.vm.define :virtualboxubuntu1604 do |virtualboxubuntu1604|
  end

  # Ansible provisioner.
  config.vm.provision "ansible" do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.playbook = "provisioning/playbook.yml"
    ansible.inventory_path = "provisioning/inventory"
    ansible.become = true
  end

end
