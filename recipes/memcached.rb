#
# Cookbook Name:: docker-runtime-cookbook
# Recipe:: memcached
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file '/tmp/memcached.Dockerfile' do
  source 'memcached.Dockerfile'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

docker_image 'dark/memcached' do
  source '/tmp/memcached.Dockerfile'
  nocache true
  rm true
  action :build_if_missing
end

docker_container 'memcached' do
  network_mode 'host'
  port '11211:11211'
  restart_policy 'on-failure'
  repo 'dark/memcached'
  action :run_if_missing
end
