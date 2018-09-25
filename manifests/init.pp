# OpenSCAP Guidelines

class hardening {

    # Prevent Log In to Accounts With Empty Password
    # xccdf_org.ssgproject.content_rule_no_empty_passwords

    exec { 'Prevent Log In to Accounts With Empty Password - system-auth':
        path    => [ '/bin', '/usr/bin', '/sbin', '/usr/sbin' ],
        command => "sed --follow-symlinks -i 's/nullok//g' /etc/pam.d/system-auth",
        onlyif  => 'grep -q nullok /etc/pam.d/system-auth'
    }

    exec { 'Prevent Log In to Accounts With Empty Password - password-auth':
        path    => [ '/bin', '/usr/bin', '/sbin', '/usr/sbin' ],
        command => "sed --follow-symlinks -i 's/nullok//g' /etc/pam.d/password-auth",
        onlyif  => 'grep -q nullok /etc/pam.d/system-auth'
    }

}
