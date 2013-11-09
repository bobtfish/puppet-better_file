# == Class better_file::service
#
# This class is meant to be called from better_file
# It ensure the service is running
#
class better_file::service {
  include better_file::params

  service { $better_file::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
