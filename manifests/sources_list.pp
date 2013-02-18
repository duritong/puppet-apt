define apt::sources_list (
  $ensure = 'present',
  $source = '',
  $content = undef
) {

  if $ensure == 'present' {
    if $source == '' and $content == undef {
      fail("One of \$source or \$content must be specified for apt_sources_snippet ${name}")
    }
    if $source != '' and $content != undef {
      fail("Only one of \$source or \$content must specified for apt_sources_snippet ${name}")
    }
  }

  include apt::dot_d_directories

  # One would expect the 'file' resource on sources.list.d to trigger an
  # apt-get update when files are added or modified in the directory, but it
  # apparently doesn't.
  file { "/etc/apt/sources.list.d/${name}":
    ensure => $ensure,
    owner  => root, group => 0, mode => '0644',
    notify => Exec['refresh_apt'],
  }

  if $source {
    File["/etc/apt/sources.list.d/${name}"] {
      source => $source,
    }
  }
  else {
    File["/etc/apt/sources.list.d/${name}"] {
      content => $content,
    }
  }
}

