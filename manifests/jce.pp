#Java Cryptography Extension class
#replaces standard cryptography jar's with extended cryptography versions
#
#
class java::jce (
    $home
) {

    file { "${home}/jre/lib/security/local_policy.jar" :
        source  => 'puppet:///modules/java/UnlimitedJCEPolicy/local_policy.jar',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
    }

    file { "${home}/jre/lib/security/US_export_policy.jar" :
        source  => 'puppet:///modules/java/UnlimitedJCEPolicy/US_export_policy.jar',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
    }
}
