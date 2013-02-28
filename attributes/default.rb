#
# Cookbook Name:: nodeuptime
# Attribute:: default
#
# Copyright (C) 2013 Millisami
#
# All rights reserved - Do Not Redistribute
#

default['nodeuptime']['name']         = "uptimely"
default['nodeuptime']['user']         = "deployer"
default['nodeuptime']['password']     = "$1$qqO27xay$dtmwY9NMmJiSa47xhUZm0." #uptime
default['nodeuptime']['group']        = "deployer"
default['nodeuptime']['deploy_to']    = "/home/#{node['nodeuptime']['user']}/#{node['nodeuptime']['name']}"
default['nodeuptime']['repo_url']     = "git://github.com/fzaninotto/uptime.git"
default['nodeuptime']['revision']     = "master"
default['nodeuptime']['domains']      = []

default['nodeuptime']['dbname']       = "uptime"

# config
default['nodeuptime']['server']['port'] = "8082"
