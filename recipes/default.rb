#
# Cookbook Name:: nodeuptime
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nodejs::install_from_package"
include_recipe "mongodb::10gen_repo"
include_recipe "git"

group node['nodeuptime']['group']
user node['nodeuptime']['user'] do
  action :create
  comment "Deployer user"
  uid 1000
  gid node['nodeuptime']['group']
  shell "/bin/bash"
  home "/home/#{node['nodeuptime']['user']}"
  password node['nodeuptime']['password']
  supports :manage_home => true
  system true
end
