class hardening::umask {

  # Ensure the Default Bash Umask is Set Correctly
  # xccdf_org.ssgproject.content_rule_accounts_umask_etc_bashrc
  file_line { 'umask - bashrc':
    path     => '/etc/bashrc',
    line     => '       umask 027',
    multiple => true,
    match    => '^\s*umask\s+\d'
  }

  # Ensure the Default Umask is Set Correctly in /etc/profile
  # xccdf_org.ssgproject.content_rule_accounts_umask_etc_profile
  file_line { 'umask - profile':
    path     => '/etc/profile',
    line     => '    umask 027',
    multiple => true,
    match    => '^\s*umask\s+\d'
  }

  # Ensure the Default Umask is Set Correctly in login.defs
  # xccdf_org.ssgproject.content_rule_accounts_umask_etc_login_defs
  file_line { 'umask - login.defs':
    path     => '/etc/login.defs',
    line     => 'UMASK       027',
    multiple => false,
    match    => '^\s*UMASK\s+\d'
  }

}
