#
# Cookbook Name:: hdp-chef
# Recipe:: ambari_server_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# create hadoop group
group 'create_hadoop_group' do
  group_name  node['hdp']['hadoop']['group']['name']
  gid         node['hdp']['hadoop']['group']['gid']
  action      :create
end

# create ambari user
user 'create_ambari_user' do
  username    node['hdp']['ambari-server']['user']['name']
  uid         node['hdp']['ambari-server']['user']['uid']
  home        node['hdp']['ambari-server']['user']['home']
  shell       node['hdp']['ambari-server']['user']['shell']
  group       node['hdp']['hadoop']['group']['name']
  supports    :manage_home => true
  action      :create
end
