class hardening::features::passwords {

  file { 'pwquality.conf' :
    ensure => present,
    path   => '/etc/security/pwquality.conf',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/hardening/pwquality.conf',
  }

}
