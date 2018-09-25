# OpenSCAP Guidelines

class hardening {

    # Prevent Log In to Accounts With Empty Password
    # xccdf_org.ssgproject.content_rule_no_empty_passwords

    # Ugly version :
    #exec { 'Prevent Log In to Accounts With Empty Password - system-auth':
    #    path    => [ '/bin', '/usr/bin', '/sbin', '/usr/sbin' ],
    #    command => "sed --follow-symlinks -i 's/nullok//g' /etc/pam.d/system-auth",
    #    onlyif  => 'grep -q nullok /etc/pam.d/system-auth'
    #}

    #exec { 'Prevent Log In to Accounts With Empty Password - password-auth':
    #    path    => [ '/bin', '/usr/bin', '/sbin', '/usr/sbin' ],
    #    command => "sed --follow-symlinks -i 's/nullok//g' /etc/pam.d/password-auth",
    #    onlyif  => 'grep -q nullok /etc/pam.d/system-auth'
    #}

    # Nice version using herculesteam/augeasproviders_pam :
    if $facts['os']['family'] == 'RedHat'
    and $facts['os']['release']['major'] == '7' {
        pam { 'Prevent Log In to Accounts With Empty Password - system-auth':
            ensure    => present,
            service   => 'system-auth',
            type      => 'password',
            control   => 'sufficient',
            module    => 'pam_unix.so',
            arguments => 'sha512 shadow try_first_pass use_authtok',
            position  => 'before module pam_deny.so',
        }

        pam { 'Prevent Log In to Accounts With Empty Password - password-auth':
            ensure    => present,
            service   => 'password-auth',
            type      => 'password',
            control   => 'sufficient',
            module    => 'pam_unix.so',
            arguments => 'sha512 shadow try_first_pass use_authtok',
            position  => 'before module pam_deny.so',
        }

    }

}
