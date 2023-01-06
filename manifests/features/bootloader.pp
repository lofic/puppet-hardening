class hardening::features::bootloader {

  # Verify /boot/grub2/grub.cfg permissions
  # xccdf_org.ssgproject.content_rule_file_permissions_grub2_cfg
  file { '/boot/grub2/grub.cfg':
    ensure => present,
    mode   => '0600',
    owner  => 'root',
    group  => 'root',
  }


}
