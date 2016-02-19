# ==== Class: java
#
# This class installs Oracle's Java from a given repository. The
# given repository is added to the Apt sources and the JAVA_HOME environment
# variable is set for the default profile. By default the package provided
# by the webupd8.com team is used.
# See: http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html
# for details
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
class java::oracle (
    $location        = $java::oracle::params::location,
    $repository_name = $java::oracle::params::repository_name,
    $release         = $java::oracle::params::release,
    $repos           = $java::oracle::params::repos,
    $key             = $java::oracle::params::key,
    $key_server      = $java::oracle::params::key_server,
) inherits java::oracle::params {

    apt::source { $repository_name:
        location   => $location,
        release    => $release,
        repos      => $repos,
        key        => { 'server' => $key_server, 'id' => $key},
        #key_server => $key_server,
    }
}
