#
# Cookbook Name:: docker-runtime-cookbook
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file '/rabbitmq.Dockerfile' do
  source 'rabbitmq.Dockerfile'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/run-rabbitmq-server.sh' do
  source 'run-rabbitmq-server.sh'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


docker_image 'dark/rabbitmq' do
  tag 'v0.0.1'
  source '/rabbitmq.Dockerfile'
  action :build_if_missing
end

docker_container 'rabbitmq' do
  network_mode 'host'
  restart_policy 'on-failure'
  repo 'dark/rabbitmq'
  action :run_if_missing
end
