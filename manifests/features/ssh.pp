# Requires the module herculesteam-augeasproviders_ssh or puppet-augeasproviders_ssh

class hardening::features::ssh inherits hardening {

    $hardening::ssh_options.each |$o, $p| {
        sshd_config { $o:
            ensure => present,
            value  => $p,
            notify => Service['sshd'],
        }
    }

}
