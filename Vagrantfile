Vagrant.configure(2) do |config|
  config.vm.box = 'bento/centos-7.1'
  config.vm.provider 'virtualbox' do |v|
    v.memory = 3 * 1024
  end

  config.berkshelf.enabled = false if Vagrant.has_plugin?('vagrant-berkshelf')
  config.vm.provision 'update', type: 'shell', inline: 'yum -y upgrade'
  %w( dependencies services release-tools ).each do |p|
    config.vm.provision p, type: 'shell', path: "scripts/install-#{p}.sh"
  end
end
