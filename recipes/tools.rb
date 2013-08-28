#
# Cookbook Name:: vmware
# Recipe:: tools
#
# Copyright 2012, Efactures
#
# Apache 2.0
#


if node.virtualization.system == 'vmware'

  apt_repository 'vmware-tools' do
    uri "http://packages.vmware.com/tools/esx/#{node.vmware.esx.tools.version}/ubuntu"
    distribution node['lsb']['codename']
    components ['main']
    key 'http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub'
    action :add
  end

  package 'vmware-tools-esx-nox' do
    action :install
  end

  package "vmware-tools-esx-kmods-#{node.kernel.release}" do
    ignore_failure true # Vmware can be slow to release package for new updated kernel
    action :install
  end

end
