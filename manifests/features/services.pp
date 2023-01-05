class hardening::features::services {

  # Ensure that /etc/cron.deny does not exist
  # xccdf_org.ssgproject.content_rule_file_cron_deny_not_exist
  file { '/etc/cron.deny': ensure => absent }


}
