# Warning Banners for System Accesses
#
# xccdf_org.ssgproject.content_rule_file_groupowner_etc_issue
# xccdf_org.ssgproject.content_rule_file_groupowner_etc_motd
# xccdf_org.ssgproject.content_rule_file_owner_etc_issue
# xccdf_org.ssgproject.content_rule_file_owner_etc_motd
# xccdf_org.ssgproject.content_rule_file_permissions_etc_issue
# xccdf_org.ssgproject.content_rule_file_permissions_etc_motd

class hardening::banner {

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
    '/etc/motd':;
    '/etc/issue':;
    '/etc/issue.net':;
  }



}
