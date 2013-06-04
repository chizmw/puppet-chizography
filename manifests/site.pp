# http://groups.google.com/group/puppet-users/browse_thread/thread/c60e8ae314ae687b
Exec {
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
}
import "nodes"
