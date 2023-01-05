# AIDE - Advanced Intrusion Detection Environment

class hardening::features::aide inherits hardening {

  # Install AIDE
  # xccdf_org.ssgproject.content_rule_package_aide_installed
  package { 'aide':
    ensure => installed,
  }

  exec { 'aide --init':
    path    => [ '/bin', '/usr/bin', '/sbin', '/usr/sbin' ],
    creates => '/var/lib/aide/aide.db.new.gz',
    user    => 'root',
  }

  exec { 'cp /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz':
    path    => [ '/bin', '/usr/bin', '/sbin', '/usr/sbin' ],
    creates =>'/var/lib/aide/aide.db.gz',
    user    => 'root',
  }

  # Configure Periodic Execution of AIDE
  # xccdf_org.ssgproject.content_rule_aide_periodic_cron_checking
  if str2bool($hardening::schedule_aide) {
    # The minute is chosen randomly to distribute the load.
    $min = fqdn_rand(30)

    cron { 'aide check':
      ensure  => absent,
      command => 'aide --check',
      user    => 'root',
      hour    => 6,
      minute  => $min,
    }
  }

}
