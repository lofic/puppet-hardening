class hardening::features::auditd {

  $rulespath='/etc/audit/rules.d'

  $rulesdefaults = {
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0640',
      notify => Exec['refresh rules'],
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
    'modules.rules' :
      path   => "${rulespath}/modules.rules",
      source => 'puppet:///modules/hardening/auditd/modules.rules',;
    'logins.rules' :
      path   => "${rulespath}/logins.rules",
      source => 'puppet:///modules/hardening/auditd/logins.rules',;
    'time-change.rules' :
      path   => "${rulespath}/time-change.rules",
      source => 'puppet:///modules/hardening/auditd/time-change.rules',;
    'audit_time_rules.rules' :
      path   => "${rulespath}/audit_time_rules.rules",
      source => 'puppet:///modules/hardening/auditd/audit_time_rules.rules',;
    'MAC-policy.rules' :
      path   => "${rulespath}/MAC-policy.rules",
      source => 'puppet:///modules/hardening/auditd/MAC-policy.rules',;
    'audit_rules_networkconfig_modification.rules' :
      path   => "${rulespath}/audit_rules_networkconfig_modification.rules",
      source => 'puppet:///modules/hardening/auditd/audit_rules_networkconfig_modification.rules',;
    'actions.rules' :
      path   => "${rulespath}/actions.rules",
      source => 'puppet:///modules/hardening/auditd/actions.rules',;
    'session.rules' :
      path   => "${rulespath}/session.rules",
      source => 'puppet:///modules/hardening/auditd/session.rules',;
    'audit_rules_usergroup_modification.rules' :
      path   => "${rulespath}/audit_rules_usergroup_modification.rules",
      source => 'puppet:///modules/hardening/auditd/audit_rules_usergroup_modification.rules',;
    'immutable.rules' :
      path   => "${rulespath}/immutable.rules",
      source => 'puppet:///modules/hardening/auditd/immutable.rules',;
  }

  exec { 'refresh rules':
    path        => ['/sbin', '/usr/sbin'],
    command     => 'augenrules',
    refreshonly => 'true',
  }

}
