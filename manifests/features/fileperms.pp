class hardening::features::fileperms() {

  $crondefaults = {
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  file {
    default: * => $crondefaults;
    '/etc/cron.hourly':;
    '/etc/cron.daily':;
    '/etc/cron.weekly':;
    '/etc/cron.monthly':;
    '/etc/cron.d':;
  }

  file { '/etc/crontab':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }


}
