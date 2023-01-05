class hardening::features::kernel {

    # xccdf_org.ssgproject.content_rule_sysctl_kernel_randomize_va_space
    # Enable Randomized Layout of Virtual Address Space
    $sysctl_kernel = @("SCK"/L)
      kernel.randomize_va_space = 2
      |SCK

    file { '/etc/sysctl.d/kernel.conf':
        ensure  => present,
        content => $sysctl_kernel,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
    }

}
