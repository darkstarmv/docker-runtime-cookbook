#
# Cookbook Name:: docker-runtime-cookbook
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file '/tmp/rabbitmq_image.tar' do
  source 'rabbitmq_image.tar'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

docker_image 'dark/rabbitmq' do
  source '/tmp/rabbitmq_image.tar'
  nocache true
  rm true
  action :build_if_missing
end

docker_container 'rabbitmq' do
  network_mode 'host'
  restart_policy 'on-failure'
  repo 'dark/rabbitmq'
  action :run_if_missing
end
