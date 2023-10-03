class custom_http_response_header {

  package { 'nginx':
    ensure => 'installed',
  }

  file { '/etc/nginx/sites-available/custom_header':
    ensure => 'present',
    content => '
      server {
          listen 80 default_server;
          listen [::]:80 default_server;

          root /var/www/html;
          index index.html;

          server_name _;

          error_page 404 /404.html;
          location = /404.html {
              root /var/www/html;
              internal;
          }

          location / {
              if ($uri ~ ^/(sdd)) {
                  return 404 "Ceci n'\''est pas une page\n";
              }
              add_header X-Served-By $hostname;
              return 200 "Hello World!\n";
          }

          location /custom_header {
              return 301 https://www.example.com; # Replace with your desired website URL
          }
      }
    ',
  }

  file { '/etc/nginx/sites-enabled/custom_header':
    ensure => 'link',
    target => '/etc/nginx/sites-available/custom_header',
  }

  service { 'nginx':
    ensure  => 'running',
    enable  => true,
    require => File['/etc/nginx/sites-available/custom_header'],
  }
}

