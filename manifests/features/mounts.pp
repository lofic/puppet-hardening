# Restrict Dynamic Mounting and Unmounting of Filesystems
#
# xccdf_org.ssgproject.content_rule_kernel_module_cramfs_disabled
# xccdf_org.ssgproject.content_rule_kernel_module_squashfs_disabled
# xccdf_org.ssgproject.content_rule_kernel_module_udf_disabled
# xccdf_org.ssgproject.content_rule_kernel_module_usb-storage_disabled

class hardening::features::mounts {

  $modprobe_cis =  @("MCIS"/L)
      install cramfs /bin/true
      blacklist cramfs
      install squashfs /bin/true
      blacklist squashfs
      install udf /bin/true
      blacklist udf
      install usb-storage /bin/true
      blacklist usb-storage
      | MCIS

  file { '/etc/modprobe.d/cis.conf':
    ensure  =>  present,
    content => $modprobe_cis,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }


}
