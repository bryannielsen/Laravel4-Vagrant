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

class postgresql_tests::system_default::test_tablespace {

  include postgresql::server

  file { '/tmp/pg_tablespaces':
    ensure  => 'directory',
    owner   => 'postgres',
    group   => 'postgres',
    mode    => '0700',
  }~>
  # This works around rubies that lack Selinux support, I'm looking at you RHEL5
  exec { "chcon system_u:object_r:postgresql_db_t /tmp/pg_tablespaces":
    refreshonly => true,
    path        => "/bin:/usr/bin",
    onlyif      => "which chcon",
    before      => File["/tmp/pg_tablespaces/space1", "/tmp/pg_tablespaces/space2"]
  }

  postgresql::tablespace{ 'tablespace1':
    location => '/tmp/pg_tablespaces/space1',
    require => [Class['postgresql::server'], File['/tmp/pg_tablespaces']],
  }
  postgresql::database{ 'tablespacedb1':
    charset => 'utf8',
    tablespace => 'tablespace1',
    require => Postgresql::Tablespace['tablespace1'],
  }
  postgresql::db{ 'tablespacedb2':
    user => 'dbuser2',
    password => 'dbuser2',
    tablespace => 'tablespace1',
    require => Postgresql::Tablespace['tablespace1'],
  }

  postgresql::database_user{ 'spcuser':
    password_hash => postgresql_password('spcuser', 'spcuser'),
    require       => Class['postgresql::server'],
  }
  postgresql::tablespace{ 'tablespace2':
    location => '/tmp/pg_tablespaces/space2',
    owner => 'spcuser',
    require => [Postgresql::Database_user['spcuser'], File['/tmp/pg_tablespaces']],
  }
  postgresql::database{ 'tablespacedb3':
    charset => 'utf8',
    tablespace => 'tablespace2',
    require => Postgresql::Tablespace['tablespace2'],
  }

}
