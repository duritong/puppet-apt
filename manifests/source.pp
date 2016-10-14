# Configure an apt source
# this is a simple wrapper for the interface
# of puppetlabs' apt module.
define apt::source (
  $ensure      = 'present',
  $location    = undef,
  $key         = undef,
  $include_src = undef,
){
  apt::sources_list{
    $name:
      ensure  => $ensure,
  }
  if $ensure == 'present' {
    validate_string($location)
    Apt::Source[$name]{
      content => "deb ${location} ${lsbdistcodename} main
deb-src ${location} ${lsbdistcodename} main\n",
    }
  }
}
