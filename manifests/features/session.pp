# Interactive session

class hardening::features::session inherits hardening {

  $ists = $hardening::interactive_session_timeout_sec
  $session_tmout = "declare -xr TMOUT=${ists}\n"

  # Set Interactive Session Timeout
  # xccdf_org.ssgproject.content_rule_accounts_tmout
  file {'/etc/profile.d/tmout.sh':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $session_tmout,
  }


}
