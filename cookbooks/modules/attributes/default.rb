#
# Cookbook Name:: modules
# Attribute:: default
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

default['modules']['install_path'] = '/usr/local/Modules'
default['modules']['module_path'] = '/usr/local/Modules/modulefiles'
default['modules']['version'] = "3.2.10"
default['modules']['url'] = "http://downloads.sourceforge.net/project/modules/Modules/modules-3.2.10/modules-3.2.10.tar.bz2"
