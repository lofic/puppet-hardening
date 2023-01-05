class hardening::umask {

  # Ensure the Default Bash Umask is Set Correctly
  # xccdf_org.ssgproject.content_rule_accounts_umask_etc_bashrc
  file_line { 'umask - bashrc':
    path     => '/etc/bashrc',
    line     => '       umask 027',
    multiple => true,
    match    => '[\t ]*umask[\t ][\t ]*[0-9]'
  }

}
