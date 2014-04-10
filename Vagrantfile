# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

nodes = [:alice, :bob]
ip = 51

def guess_public_key()
  %w"ecdsa rsa dsa".each do |method|
    path = File.expand_path "~/.ssh/id_#{method}.pub"
    return IO.read path if File.exist? path
  end
  raise "Public key not found."
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |main_config|
  main_config.hostmanager.enabled = true
  main_config.hostmanager.manage_host = true
  main_config.hostmanager.ignore_private_ip = false
  main_config.hostmanager.include_offline = true
  nodes.each do |node|
    main_config.vm.define node do |config|
      # All Vagrant configuration is done here. The most common configuration
      # options are documented and commented below. For a complete reference,
      # please see the online documentation at vagrantup.com.
      config.hostmanager.aliases = [node, "#{node}.ipython.local"]

      config.vm.box = "debian-wheezy64-bearstech"
      config.vm.box_url = "http://download.bearstech.com/vagrant-debian-wheezy64-bearstech.box"
      # Every Vagrant virtual environment requires a box to build off of.

      # The url from where the 'config.vm.box' box will be fetched if it
      # doesn't already exist on the user's system.
      # config.vm.box_url = "http://domain.com/path/to/above.box"

      # Create a forwarded port mapping which allows access to a specific port
      # within the machine from a port on the host machine. In the example below,
      # accessing "localhost:8080" will access port 80 on the guest machine.
      # config.vm.network :forwarded_port, guest: 80, host: 8080

      # Create a private network, which allows host-only access to the machine
      # using a specific IP.
      # config.vm.network :private_network, ip: "192.168.33.10"

      # Create a public network, which generally matched to bridged network.
      # Bridged networks make the machine appear as another physical device on
      # your network.
      config.vm.network :private_network, ip: "192.168.33.#{ip}"
      ip += 1

      config.vm.hostname = node

      # If true, then any SSH connections made will enable agent forwarding.
      # Default value: false
      # config.ssh.forward_agent = true

      # Share an additional folder to the guest VM. The first argument is
      # the path on the host to the actual folder. The second argument is
      # the path on the guest to mount the folder. And the optional third
      # argument is a set of non-required options.
      # config.vm.synced_folder "../data", "/vagrant_data"

      # Provider-specific configuration so you can fine-tune various
      # backing providers for Vagrant. These expose provider-specific options.
      # Example for VirtualBox:
      #
      config.vm.provider :virtualbox do |vb, override|
        #   # Don't boot with headless mode
        #  vb.gui = true
        #
        #   # Use VBoxManage to customize the VM. For example to change memory:
        #   vb.customize ["modifyvm", :id, "--memory", "1024"]
        override.vm.provision :hostmanager
      end
      #
      # View the documentation for the provider you're using for more
      # information on available options.
      config.vm.provision :shell, inline:  <<SCRIPT
mkdir -p /root/.ssh
echo \"#{guess_public_key}\" >> /root/.ssh/authorized_keys
if [ ! -d /usr/share/python-apt ]
then
   sudo apt-get update && sudo apt-get install --quiet --assume-yes python-apt;
fi
SCRIPT
      #config.vm.provision "ansible" do |ansible|
        #ansible.verbose = true
        #ansible.playbook = "playbook.yml"
      #end
    end
  end
end
