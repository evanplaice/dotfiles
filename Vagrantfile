#!/usr/bin/env ruby
Vagrant.configure("2") do |config|
  config.vm.hostname = "ElementaryOS"
  config.vm.box = "evanplaice/elementaryos-5.1-hera"
  config.vm.box_version = "1.0"
  config.vm.synced_folder ".", "/home/vagrant/dotfiles", owner: "vagrant", group: "vagrant"
  config.vm.provider :virtualbox do |vb|
    vb.name = "ElementaryOS"
    vb.gui = true
    vb.memory = "2048"
  end
  config.vm.provision :shell do |shell| 
    shell.inline = "cd /home/vagrant/dotfiles && . ./bootstrap.sh"
    shell.privileged = false
  end
end
