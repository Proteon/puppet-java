#Java Cryptography Extension class
#replaces standard cryptography jar's with extended cryptography versions
#
#
class java::oracle_1_7_0::jce (
  $home    = $java::oracle_1_7_0::params::home
) inherits java::oracle_1_7_0::params {

  file { "${home}/jre/lib/security/local_policy.jar" :
    source => 'puppet:///modules/java/UnlimitedJCEPolicy/local_policy.jar',
  }

  file { "${home}/jre/lib/security/US_export_policy.jar" :
    source => 'puppet:///modules/java/UnlimitedJCEPolicy/US_export_policy.jar',
  }
}
