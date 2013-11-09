# == Class: better_file
#
# Full description of class better_file here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class better_file (
) inherits better_file::params {

  # validate parameters here

  class { 'better_file::install': } ->
  class { 'better_file::config': } ~>
  class { 'better_file::service': } ->
  Class['better_file']
}
