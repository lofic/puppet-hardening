class hardening::features::pam {

  # Enforce usage of pam_wheel for su authentication
  # xccdf_org.ssgproject.content_rule_use_pam_wheel_for_su
  file_line { 'pam_wheel':
    path     => '/etc/pam.d/su',
    line     => 'auth       required    pam_wheel.so use_uid',
    multiple => false,
    match    => '^\s*#\s*auth\s+required\s+pam_wheel.so'
  }

}
