class apt::unattended_upgrades {
  package{'unattended-upgrades':
    ensure => present,
    require => undef,
  }

  config_file {
    "/etc/apt/apt.conf.d/50unattended-upgrades":
    source  => ["puppet:///modules/site-apt/50unattended-upgrades",
		"puppet:///modules/apt/50unattended-upgrades" ],

    before => Config_file[apt_config],
    require => Package['unattended-upgrades'],
  }
}
