# manage dselect
class apt::dselect {

  # suppress annoying help texts of dselect
  file_line { 'dselect_expert':
      path => '/etc/dpkg/dselect.cfg',
      line => 'expert',
  }

  package { 'dselect': ensure => installed }
}
