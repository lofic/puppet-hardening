# Warning Banners for System Accesses
#
# xccdf_org.ssgproject.content_rule_file_groupowner_etc_issue
# xccdf_org.ssgproject.content_rule_file_groupowner_etc_motd
# xccdf_org.ssgproject.content_rule_file_owner_etc_issue
# xccdf_org.ssgproject.content_rule_file_owner_etc_motd
# xccdf_org.ssgproject.content_rule_file_permissions_etc_issue
# xccdf_org.ssgproject.content_rule_file_permissions_etc_motd

class hardening::features::banner inherits hardening {

  $bannerdefaults = {
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0640',
  }

  # Bannieres non modifiables, params de boot non lisibles
  file {
    default: * => $bannerdefaults;
    '/boot/grub2/grub.cfg':;
    '/etc/issue.net':;
  }

  file {
    default: * => $bannerdefaults;
    '/etc/motd':
      content => $hardening::banner_message;
    '/etc/issue':
      content => $hardening::banner_message;
  }


}
