class java::openjdk_1_8_0 (
    $package = $java::openjdk_1_8_0::params::package) inherits java::openjdk_1_8_0::params {
    if (!defined(Package[$package])) {
        package { $package: ensure => installed }
    }
}
