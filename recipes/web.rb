#
# Cookbook Name:: uptimely
# Recipe:: web
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx"

nginx_config_path = "/etc/nginx/sites-available/#{node['uptimely']['name']}"
template nginx_config_path do
  mode 0644
  source "nginx.conf.erb"
  variables ({
    :deploy_to => node['uptimely']['deploy_to'],
  })
  notifies :reload, "service[nginx]"
end

nginx_site "default" do
  action :disable
end

nginx_site node['uptimely']['name'] do
  config_path nginx_config_path
  action :enable
end
