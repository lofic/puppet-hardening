class hardening::features::sudo {

  # xccdf_org.ssgproject.content_rule_sudo_add_use_pty
  # Ensure Only Users Logged In To Real tty Can Execute Sudo - sudo use_pty
  file { '/etc/sudoers.d/00_defaults':
    content => "Defaults use_pty\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
  }

}
