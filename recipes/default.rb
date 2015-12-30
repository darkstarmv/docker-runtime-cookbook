#
# Cookbook Name:: docker-runtime-cookbook
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

docker_service 'tls_test:2376' do
  host [ "tcp://#{node['ipaddress']}:2376", 'unix:///var/run/docker.sock' ]
  # tls_verify true
  # tls_ca_cert '/path/to/ca.pem'
  # tls_server_cert '/path/to/server.pem'
  # tls_server_key '/path/to/server-key.pem'
  # tls_client_cert '/path/to/client.pem'
  # tls_client_key '/path/to/client-key.pem'
  action [:create, :start]
end

docker_image "consul-server" do
  repo 'gliderlabs/consul-server'
  action :pull
end

docker_container 'consul-server' do
  network_mode 'host'
  privileged true
  tty true
  restart_policy 'on-failure'
  repo 'gliderlabs/consul-server'
  command ' -bootstrap'
  action :run_if_missing
end

docker_image "registrator" do
  repo 'gliderlabs/registrator'
  action :pull
end

docker_container 'registrator' do
  repo 'gliderlabs/registrator'
  network_mode 'host'
  restart_policy 'on-failure'
  binds [ '/var/run/docker.sock:/tmp/docker.sock' ]
  command ' consul://localhost:8500'
  action :run_if_missing
end

