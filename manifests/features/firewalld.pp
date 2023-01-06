class hardening::features::firewalld {

  # Set Default firewalld Zone for Incoming Packets.
  # Packets which are not explicitly permitted should not be accepted.
  # xccdf_org.ssgproject.content_rule_set_firewalld_default_zone
  file_line { 'set_firewalld_default_zone':
    path  => '/etc/firewalld/firewalld.conf',
    line  => 'DefaultZone=drop',
    match => '^\s*DefaultZone='
  }

}
