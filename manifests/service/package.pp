# == Class: tomcat::service::package
#
# This class configures the tomcat service when installed from packages
#
class tomcat::service::package {
  # The base class must be included first
  if !defined(Class['tomcat']) {
    fail('You must include the tomcat base class before using any tomcat sub class')
  }

  # tomcat service

  if $::tomcat::service_ensure == 'none' {
    $service_ensure = undef
  } else {
    $service_ensure = $::tomcat::service_ensure
  }
  service { $::tomcat::service_name_real:
    ensure => $service_ensure,
    enable => $::tomcat::service_enable
  }
}
