class naginator::params {

 case $::osfamily {
   'redhat': {
        $service_name      = 'nagios'
        $package_name      = 'nagios'
        $nrpe_package      = 'nrpe'
        $nrpe_service      = 'nrpe'
        $nagios_plugin     = "nagios-plugins"
        $package_name_list = [ "nagios", "nagios-plugins-nrpe", "nagios-plugins", ]
        $cfg_files         = [ "/etc/nagios/conf.d/nagios_command.cfg",
                               "/etc/nagios/conf.d/nagios_host.cfg",
                               "/etc/nagios/conf.d/nagios_hostextinfo.cfg",
                               "/etc/nagios/conf.d/nagios_service.cfg", ]
        $nagios_users      = '/etc/nagios/passwd'
        $passwd_path       = 'puppet:///modules/naginator/rhel/passwd'
        $cgi_cfg           = '/etc/nagios/cgi.cfg'
        $cgi_file_path     = 'puppet:///modules/naginator/rhel/cgi.cfg'
        $perl_pkg_list     = ["nagios-plugins-perl", "perl-libwww-perl",]
        $nrpe_dir          = "/etc/nrpe.d"
        $plugin_dir        = "/usr/lib64/nagios/plugins"
   }
   'debian': {
        $service_name      = 'nagios3'
        $package_name      = 'nagios3'
        $nrpe_package      = 'nagios-nrpe-server'
        $nrpe_service      = 'nagios-nrpe-server'
        $nagios_plugin     = 'nagios-plugins'
        $package_name_list = [ "nagios3", "nagios-nrpe-plugin", "nagios-plugins",
                               "nagios3-doc", ]
        $cfg_files         = [ "/etc/nagios3/conf.d/nagios_command.cfg",
                               "/etc/nagios3/conf.d/nagios_host.cfg",
                               "/etc/nagios3/conf.d/nagios_hostextinfo.cfg",
                               "/etc/nagios3/conf.d/nagios_service.cfg", ]
        $nagios_users      = "/etc/nagios3/htpasswd.users"
        $passwd_path       = 'puppet:///modules/naginator/ubuntu/htpasswd.users'
        $cgi_cfg           = '/etc/nagios3/cgi.cfg'
        $cgi_file_path     = 'puppet:///modules/naginator/ubuntu/cgi.cfg'
        $perl_pkg_list     = [ "libnagios-plugin-perl", "libwww-perl", "libjson-perl", ] 
        $nrpe_dir          = "/etc/nagios/nrpe.d"
        $plugin_dir        = "/usr/lib/nagios/plugins"
   }
    default: {
        fail("unsupported osfamily: $::osfamily")
   }
 }
}
