class hardening::features::auditd {

  $rulespath='/etc/audit/rules.d'

  $rulesdefaults = {
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0640',
  }

  file {
    default: * => $rulesdefaults;
    'delete.rules' :
      path   => "${rulespath}/delete.rules",
      source => 'puppet:///modules/hardening/auditd/delete.rules',;
    'perm_mod.rules' :
      path   => "${rulespath}/perm_mod.rules",
      source => 'puppet:///modules/hardening/auditd/perm_mod.rules',;
    'access.rules' :
      path   => "${rulespath}/access.rules",
      source => 'puppet:///modules/hardening/auditd/access.rules',;
  }

}
