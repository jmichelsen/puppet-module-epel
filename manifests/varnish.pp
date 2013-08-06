# Class varnish
#
# Actions:
#   Configure the proper repositories and import GPG keys
#
# Reqiures:
#   You should probably be on an Enterprise Linux variant. (Centos, RHEL, Scientific, Oracle, Ascendos, et al)
#
# Sample Usage:
#  include rpmrepos::varnish
#
class rpmrepos::varnish {
    yumrepo { 'varnish-3.0':
        baseurl     => "http://repo.varnish-cache.org/redhat/varnish-3.0/el${::os_maj_version}/${::architecture}/",
        enabled     => 1,
        gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-varnish',
        gpgcheck    => 0,
        descr       => "Varnish-3.0 CentOS-${::os_maj_version}-${::architecture}"
    }
    
    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-varnish":
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => "puppet:///modules/rpmrepos/RPM-GPG-KEY-varnish",
    }
    
    rpmrepos::rpm_gpg_key{ "varnish":
        path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-varnish",
    }
}
