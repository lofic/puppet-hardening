class hardening::features::network inherits hardening {

  # Disable Kernel Parameter for IP Forwarding on IPv4 Interfaces
  # xccdf_org.ssgproject.content_rule_sysctl_net_ipv4_ip_forward

  $ip_forward = $hardening::ip_forwarding ? {
    true    => '1',
    default => '0'
  }

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

      net.ipv4.ip_forward=${ip_forward}
      | SCN

  file { '/etc/sysctl.d/network.conf':
      ensure  => present,
      content => $sysctl_net,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
  }
  $modprobe_net =  @("MN"/L)
      install dccp /bin/true
      blacklist dccp
      install sctp /bin/true
      blacklist sctp
      | MN

  file { '/etc/modprobe.d/net.conf':
    ensure  =>  present,
    content => $modprobe_net,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }


}
