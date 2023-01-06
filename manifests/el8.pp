class hardening::el8() {

  include hardening::features::aide
  include hardening::features::authselect
  include hardening::features::banner
  include hardening::features::bootloader
  include hardening::features::chrony
  include hardening::features::coredumps
  include hardening::features::fileperms
  include hardening::features::journald
  include hardening::features::kernel
  include hardening::features::mounts
  include hardening::features::network
  include hardening::features::openscap
  include hardening::features::pam
  include hardening::features::passwords
  include hardening::features::services
  include hardening::features::session
  include hardening::features::ssh
  include hardening::features::sudo
  include hardening::features::umask

}
