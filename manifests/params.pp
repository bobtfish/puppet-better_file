# == Class better_file::params
#
# This class is meant to be called from better_file
# It sets variables according to platform
#
class better_file::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'better_file'
      $service_name = 'better_file'
    }
    'RedHat', 'Amazon': {
      $package_name = 'better_file'
      $service_name = 'better_file'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
