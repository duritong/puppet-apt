class apt::unattended_upgrades {
  package{'unattended-upgrades':
    ensure => present,
    require => undef,
  }

  config_file {
    "/etc/apt/apt.conf.d/unattended_upgrades":
      content => 'APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
',
      before => Config_file[apt_config],
      require => Package['unattended-upgrades'],
  }
}