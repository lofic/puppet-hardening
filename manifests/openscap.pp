# Provide OpenSCAP to check the security of the system against some security
# policies (like the CIS benchmark or the PCI-DSS baseline)
class hardening::openscap {

  package { 'openscap-scanner':
    ensure  => present,
  }

  package { 'scap-security-guide':
    ensure  => present,
  }

  $orm = $::facts['os']['release']['major']
  $distro =  $::facts['os']['name'] ? {
    'Rocky'  => 'rl',
    'CentOS' => 'centos',
    'RedHat' => 'rhel',
    default  => 'rhel'
  }

  $scap_scan =  @("SCAPSCAN"/)
      oscap xccdf eval \\
        --profile xccdf_org.ssgproject.content_profile_cis \\
        --results scan_results-\$(hostname -s).xml \\
        --report  scan_report-\$(hostname -s).html \\
        /usr/share/xml/scap/ssg/content/ssg-${distro}${orm}-ds.xml
      | SCAPSCAN

  file { 'scapscan.sh' :
    ensure  => present,
    path    => '/root/scapscan.sh',
    content => $scap_scan,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

}
