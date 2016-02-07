#
# Cookbook Name:: modules
# Provider:: modulefile
#
# Copyright (C) 2012 Allan Espinosa
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

def load_current_resource
  @current_resource = Chef::Resource::ModulesModulefile.new(new_resource.name)
end

action :create do
  file ::File.join(node['modules']['module_path'], new_resource.name)
end
