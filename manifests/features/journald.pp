class hardening::features::journald {

  $jdpath = '/etc/systemd/journald.conf'

  # Ensure journald is configured to compress large log files
  # xccdf_org.ssgproject.content_rule_journald_compress
  file_line { 'journald - Compress':
    path     => $jdpath,
    line     => 'Compress=yes',
    multiple => false,
    match    => '^\s*[#]*\s*Compress=',
    notify   => Service['systemd-journald'],
  }

  # Ensure journald is configured to send logs to rsyslog
  # xccdf_org.ssgproject.content_rule_journald_forward_to_syslog
  file_line { 'journald - ForwardToSyslog':
    path     => $jdpath,
    line     => 'ForwardToSyslog=yes',
    multiple => false,
    match    => '^\s*[#]*\s*ForwardToSyslog=',
    notify   => Service['systemd-journald'],
  }

  # Ensure journald is configured to write log files to persistent disk
  # xccdf_org.ssgproject.content_rule_journald_storage
  file_line { 'journald - Storage':
    path     => $jdpath,
    line     => 'Storage=persistent',
    multiple => false,
    match    => '^\s*[#]*\s*Storage=',
    notify   => Service['systemd-journald'],

  }

  service { 'systemd-journald':
    ensure => 'running',
    enable => true,
  }

}
