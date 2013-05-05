# puppet-postgresql
# For all details and documentation:
# http://github.com/inkling/puppet-postgresql
#
# Copyright 2012- Inkling Systems, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

group {'puppet':
  ensure => present,
}

user {'puppet':
  ensure => present,
  gid    => 'puppet',
}

file { '/etc/sudoers.d':
  ensure => directory,
  mode   => '0750',
  owner   => root,
  group   => root,
}

file {'/etc/sudoers.d/puppet_postgresql_tests':
  ensure  => file,
  content => 'vagrant ALL=(ALL) ALL',
  mode    => '0440',
  owner   => root,
  group   => root,
}
