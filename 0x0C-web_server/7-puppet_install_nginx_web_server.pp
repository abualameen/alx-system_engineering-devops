# 7-puppet_install_nginx_web_server.pp
# task and and 2 using puppet
# Install Nginx package
package { 'nginx':
  ensure => 'installed',
}

# Define the Nginx server block for the default server
file { '/etc/nginx/sites-available/default':
  ensure => present,
  content => '
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html;

    server_name _;

    location / {
        return 200 "Hello World!\n";
    }

    location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }
}
',
  notify => Service['nginx'],
}

# Create the symbolic link for the default site
file { '/etc/nginx/sites-enabled/default':
  ensure => link,
  target => '/etc/nginx/sites-available/default',
  notify => Service['nginx'],
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}

