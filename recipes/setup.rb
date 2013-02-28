#
# Cookbook Name:: uptimely
# Recipe:: setup
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nodejs::install_from_source"
node.override['nodejs']['version'] = '0.8.21'
node.override['nodejs']['checksum'] = '65ab7307f1aee12be4c88e396e2510967a52b1c6'

include_recipe "mongodb::10gen_repo"
include_recipe "git"

group node['uptimely']['group']
user node['uptimely']['user'] do
  action :create
  comment "Deployer user"
  uid 1000
  gid node['uptimely']['group']
  shell "/bin/bash"
  home "/home/#{node['uptimely']['user']}"
  password node['uptimely']['password']
  supports :manage_home => true
  system true
end

deploy_revision node['uptimely']['deploy_to'] do
  repo            "git://github.com/fzaninotto/uptime"
  revision        node['uptimely']['revision']
  user            node['uptimely']['user']
  migrate         false
  environment     "NODE_ENV" => "production" #, "OTHER_ENV" => "foo"
  shallow_clone   true
  action          :deploy # or :rollback
  symlinks({})
  symlink_before_migrate({})
  before_restart do
    execute "npm-install" do
      cwd release_path
      user node['uptimely']['owner']
      group node['uptimely']['group']
      command "npm install"
      environment ({'NODE_ENV' => 'production'})
    end
  end
end

template "#{node['uptimely']['deploy_to']}/current/config/production.yaml" do
  source  "config.yaml.erb"
  owner   node['uptimely']['user']
  group   node['uptimely']['group']
  mode    00644
  # variables( :config_var => node[:configs][:config_var] )
end

directory "#{node['uptimely']['deploy_to']}/shared/pids" do
  owner node['uptimely']['user']
  group "root"
  mode 00775
  action :create
end

file "#{node['uptimely']['deploy_to']}/shared/pids/#{node['uptimely']['name']}.pid" do
  action :create_if_missing
  owner node['uptimely']['user']
  mode 00755
end

directory "#{node['uptimely']['deploy_to']}/shared/log" do
  owner node['uptimely']['user']
  group "root"
  mode 00775
  action :create
end

file "#{node['uptimely']['deploy_to']}/shared/log/#{node['uptimely']['name']}.log" do
  action :create_if_missing
  owner node['uptimely']['user']
  mode 00755
end

template "/etc/init/#{node['uptimely']['name']}.conf" do
  mode '0755'
  owner "root"
  group "root"
  source "uptime.init.conf.erb"
end

service "#{node['uptimely']['name']}" do
  provider Chef::Provider::Service::Upstart
  supports :start => true, :stop => true, :restart => true, :status => true
  action :nothing
end

service "#{node['uptimely']['name']}" do
  action :restart
end
