class hardening::features::authselect inherits hardening {

  # Enable authselect
  # xccdf_org.ssgproject.content_rule_enable_authselect
  $asp = $hardening::authselect_profile
  $asp_features = 'with-mkhomedir with-sudo'

  exec { 'authselect set profile':
    path    => ['/usr/bin', '/usr/sbin',],
    command => "authselect select ${asp} ${asp_features} --force",
    unless  => 'authselect current',
  }

}
