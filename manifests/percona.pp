# Class percona
#
# Actions:
#   Configure the proper repositories and import GPG keys
#
# Reqiures:
#   You should probably be on an Enterprise Linux variant. (Centos, RHEL, Scientific, Oracle, Ascendos, et al)
#
# Sample Usage:
#  include rpmrepos::percona
#
class rpmrepos::percona {
    yumrepo { 'percona':
        baseurl     => "http://repo.percona.com/centos/${::os_maj_version}/os/${::architecture}/",
        enabled     => 1,
        gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-percona',
        gpgcheck    => 1,
        descr       => "Percona - CentOS-${::os_maj_version}-${::architecture}"
    }
    
    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-percona":
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => "puppet:///modules/rpmrepos/RPM-GPG-KEY-percona",
    }
    
    rpmrepos::rpm_gpg_key{ "percona":
        path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-percona",
    }
}
