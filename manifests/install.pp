# == Class better_file::intall
#
class better_file::install {
  include better_file::params

  package { $better_file::params::package_name:
    ensure => present,
  }
}
