Vagrant.configure(2) do |config|
  config.vm.box = 'bento/centos-7.1'
  config.vm.provider 'virtualbox' do |v|
    v.memory = 3 * 1024
  end

  config.vm.network "private_network", ip: "172.216.50.13"
  { memcached: 11211, redis: 6379, app: 8080 }.each_pair do |_, port|
    config.vm.network 'forwarded_port', guest: port, host: port
  end

  config.berkshelf.enabled = false if Vagrant.has_plugin?('vagrant-berkshelf')
  config.vm.provision 'update', type: 'shell', inline: 'yum -y upgrade'
  %w( release-tools dependencies services ).each do |p|
    config.vm.provision p, type: 'shell', path: "scripts/install-#{p}.sh"
  end
end
