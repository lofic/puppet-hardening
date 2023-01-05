class hardening::el8() {

  include hardening::aide
  include hardening::banner
  include hardening::chrony
  include hardening::coredumps
  include hardening::fileperms
  include hardening::kernel
  include hardening::mounts
  include hardening::network
  include hardening::openscap
  include hardening::sudo
  include hardening::umask

}
