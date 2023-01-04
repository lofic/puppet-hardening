class hardening::network {

  $sysctl_net =  @("SCN"/L)
      net.ipv4.tcp_syncookies = 1
      net.ipv4.conf.all.send_redirects = 0
      net.ipv4.conf.default.send_redirects = 0
      net.ipv4.conf.all.accept_source_route = 0
      net.ipv4.conf.default.accept_source_route = 0
      net.ipv4.conf.all.accept_redirects = 0
      net.ipv4.conf.default.accept_redirects = 0
      net.ipv4.conf.all.secure_redirects = 0
      net.ipv4.conf.default.secure_redirects = 0
      net.ipv4.conf.all.log_martians = 1
      net.ipv4.conf.default.log_martians = 1
      net.ipv4.icmp_echo_ignore_broadcasts = 1
      net.ipv4.icmp_ignore_bogus_error_responses = 1
      net.ipv4.conf.all.rp_filter = 1
      net.ipv4.conf.default.rp_filter = 1
      net.ipv6.conf.all.accept_ra = 0
      net.ipv6.conf.default.accept_ra = 0
      | SCN

  file { '/etc/sysctl.d/network.conf':
      ensure  => present,
      content => $sysctl_net,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
  }

}
