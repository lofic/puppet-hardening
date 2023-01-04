# Restrict Dynamic Mounting and Unmounting of Filesystems
#
# xccdf_org.ssgproject.content_rule_kernel_module_cramfs_disabled
# xccdf_org.ssgproject.content_rule_kernel_module_squashfs_disabled
# xccdf_org.ssgproject.content_rule_kernel_module_udf_disabled
# xccdf_org.ssgproject.content_rule_kernel_module_usb-storage_disabled

class hardening::mounts {

  $modprobe_cis =  @("MCIS"/L)
      install cramfs /bin/true
      install squashfs /bin/true
      install udf /bin/true
      install usb-storage /bin/true
      | MCIS

  file { '/etc/modprobe.d/cis.conf':
    ensure  =>  present,
    content => $modprobe_cis,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
