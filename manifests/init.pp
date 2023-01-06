# Don't put any resource here. This class is inherited for parameters

# Hardening RHEL 8 (RHEL 9 ?) using recommendations from the Openscap CIS
# benchmark.
#
# sshd hardening : see also https://github.com/lofic/puppet-ssh

class hardening (
  String  $banner_message,
  Array   $ssh_options,
  String  $authselect_profile = 'sssd',
  Boolean $coredumps = false,
  Numeric $interactive_session_timeout_sec = 900,
  Boolean $ip_forwarding = false,
  Boolean $schedule_aide = false,
) {}
