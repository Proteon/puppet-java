class java::oracle_1_8_0 (
    $package = $java::oracle_1_8_0::params::package,
    $home    = $java::oracle_1_8_0::params::home) inherits java::oracle_1_8_0::params {
    include oracle

    package { $package:
        ensure  => installed,
        require => [
            Class['oracle'],
            Apt::Source[$java::oracle::params::repository_name],
            Exec[apt_update],
        ],
    }

    exec { "${package}accepted-oracle-license-v1-1":
        command => "/bin/echo ${package} shared/accepted-oracle-license-v1-1 select true | /usr/bin/sudo /usr/bin/debconf-set-selections",
        unless  => "/usr/bin/debconf-show ${package} | grep 'shared/accepted-oracle-license-v1-1: true'",
    }
}
