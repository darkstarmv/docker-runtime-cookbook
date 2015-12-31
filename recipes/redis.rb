#
# Cookbook Name:: docker-runtime-cookbook
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file '/tmp/redis.Dockerfile' do
  source 'redis.Dockerfile'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

docker_image 'dark/redis' do
  source '/tmp/redis.Dockerfile'
  nocache true
  rm true
  action :build_if_missing
end

docker_container 'redis' do
  network_mode 'host'
  port '6379:6379'
  restart_policy 'on-failure'
  repo 'dark/redis'
  action :run_if_missing
end
