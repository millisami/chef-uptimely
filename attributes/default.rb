#
# Cookbook Name:: uptimely
# Attribute:: default
#
# Copyright (C) 2013 Millisami
#
# All rights reserved - Do Not Redistribute
#

default['uptimely']['name']         = "uptimely"
default['uptimely']['user']         = "deployer"
default['uptimely']['password']     = "$1$qqO27xay$dtmwY9NMmJiSa47xhUZm0." #uptime
default['uptimely']['group']        = "deployer"
default['uptimely']['deploy_to']    = "/home/#{node['uptimely']['user']}/#{node['uptimely']['name']}"
default['uptimely']['repo_url']     = "git://github.com/fzaninotto/uptime.git"
default['uptimely']['revision']     = "master"
default['uptimely']['domains']      = []

default['uptimely']['dbname']       = "uptime"

# config
default['uptimely']['server']['port'] = "8082"
