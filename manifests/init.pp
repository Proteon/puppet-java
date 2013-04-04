# ==== Class: java
#
# This class installs Oracle's Java version 1.6 from a given repository. The
# given repository is added to the Apt sources and the JAVA_HOME environment
# variable is set for the default profile.
#
# === Parameters
#
# Document parameters here.
#
# [*location*] Apt repository location providing the java packages.
# [*package*] Package name for the to be installed java package.
# [*release*] The release version of the operating system.
# [*repos*] The repository providing the package (main, nightly, etc).
# [*key*] The GPG key for the repository.
# [*key_server*] The GPG key-server for the public key.
#
# === Variables
#
# === Examples
#
#  class { java:
#    location        => 'http://apt.your-company-repository.com/ubuntu/',
#    package         => 'sun-java6-jdk',
#    repository_name => 'your-company-repository',
#    release         => $::lsbdistcodename,
#    repos           => 'main',
#    key             => '1234567',
#    key_server      => 'keyserver.ubuntu.com',
#  }
#
# === Authors
#
# Sander Bilo <sander@proteon.nl>
#
# === Copyright
#
# Copyright 2013 Proteon.
#
class java(
  $location        = $java::params::location,
  $package         = 'sun-java6-jdk',
  $repository_name = 'java-jdk-repository',
  $release         = $::lsbdistcodename,
  $repos           = 'main',
  $key             = undef,
  $key_server      = 'keyserver.ubuntu.com',
) inherits java::params {

  if $location == '' {
    fail('You must set a repository location')
  }

  apt::source { $repository_name:
    location    => $location,
    release     => $release,
    repos       => $repos,
    key         => $key,
    key_server  => $key_server,
  }

  package { $package:
    ensure      => held,
    require     => Apt::Source[$repository_name]
  }

  profile_d::script {'JAVA_HOME.sh':
    ensure  => present,
    content => "export JAVA_HOME=${java::params::home}",
  }

}
