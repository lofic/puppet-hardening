# Ensure that chronyd is running under chrony user account
# xccdf_org.ssgproject.content_rule_chronyd_run_as_chrony_user

class hardening::chrony {

    file { '/etc/sysconfig/chronyd':
    content => "OPTIONS=\"-u chrony\"\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
