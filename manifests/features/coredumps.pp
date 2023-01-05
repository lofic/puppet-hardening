class hardening::features::coredumps inherits hardening {

  $no_core =  @("NCL"/L)
      # No core dumps
      * hard core 0
      * soft core 0
      | NCL

  $core_unlimited =  @("CL"/L)
      # core dumps unlimited
      * soft core unlimited
      | CL

  case str2bool($hardening::coredumps) {
    true: {
      $dumpable = 1
      $core_pattern = '|/usr/lib/systemd/systemd-coredump %P %u %g %s %t %c %h %e'
      $core_limits = $core_unlimited
    }
    default: {
      $dumpable = 0
      $core_pattern = '|/bin/false'
      $core_limits = $no_core
    }
  }

  file { '/etc/security/limits.d/core_dumps.conf':
    ensure  => present,
    content => $core_limits,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  $coredumpcfg_disable = @("CCIS"/L)
      # See coredump.conf(5) for details.
      [Coredump]
      Storage=none
      ProcessSizeMax=0
      | CCIS

  unless str2bool($hardening::coredumps) {
    file { '/etc/systemd/coredump.conf':
        content => $coredumpcfg_disable,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
    }
  }

  $sysctl_coredumps =  @("SCCD"/L)
      fs.suid_dumpable = ${dumpable}
      kernel.core_pattern = ${core_pattern}
      | SCCD


  file { '/etc/sysctl.d/coredumps.conf':
      ensure  => present,
      content => $sysctl_coredumps,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
  }


}
