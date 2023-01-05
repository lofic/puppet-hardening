class hardening::features::fileperms() {

  file { '/etc/cron.hourly':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  file { '/etc/cron.daily':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  file { '/etc/cron.weekly':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  file { '/etc/cron.monthly':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  file { '/etc/crontab':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }

  file { '/etc/cron.d':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

}
