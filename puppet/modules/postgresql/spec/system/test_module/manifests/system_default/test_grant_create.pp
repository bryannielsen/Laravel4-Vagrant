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

class postgresql_tests::system_default::test_grant_create($user, $password, $db) {

  include postgresql::server

  # Since we are not testing pg_hba or any of that, make a local user for ident auth
  user { $user:
    ensure => present,
  }

  postgresql::database_user { $user:
    password_hash => postgresql_password($user, $password),
    require  => [ Class['postgresql::server'],
                  User[$user] ],
  }

  postgresql::database { $db:
    require => Class['postgresql::server'],
  }

  postgresql::database_grant { 'grant create test':
    privilege   => 'CREATE',
    db          => $db,
    role        => $user,
    require     => [ Postgresql::Database[$db],
                     Postgresql::Database_user[$user] ],
  }
}
