# == Class: java::openjdk_1_8_0::params
#
# This class manages parameters for the java::openjdk_1_8_0 Puppet class in this module.
#
# === Parameters
#
# === Variables
#
# === Examples
#
# === Authors
#
# Sander Bilo <sander@proteon.nl>
#
# === Copyright
#
# Copyright 2013 Proteon.
#
class java::openjdk_1_8_0::params {
    $home = "/usr/lib/jvm/java-1.8.0-openjdk-${::architecture}"
    $package = 'openjdk-8-jre'
}
