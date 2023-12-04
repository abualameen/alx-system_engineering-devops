# Puppet script to install and configure Nginx

# Update the package list
package { 'nginx':
  ensure => 'latest',
}

# Set custom hostname
$custom_hostname = $::hostname

# Modify Nginx configuration in sites-available using a single sed command
$placement = "server_name $custom_hostname;\\n\\trewrite ^\\/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;\\n\\tadd_header X-Served-By $custom_hostname;"
exec { 'configure_nginx':
  command => "/bin/sed -i 's#listen 80 default_server;#listen 80;#' /etc/nginx/sites-enabled/default",
  path    => '/usr/bin',
  require => Package['nginx'],
}

# Update Hello World! page content
file { '/var/www/html/index.html':
  content => 'Hello World!',
  mode    => '0644',
}

# Configure Nginx for redirection
exec { 'configure_nginx_redirection':
  command => "/bin/sed -i \"s#server_name _;#${placement}#\" /etc/nginx/sites-enabled/default",
  path    => '/usr/bin',
  require => File['/var/www/html/index.html'],
}

# Restart Nginx using service
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Exec['configure_nginx_redirection'],
}
