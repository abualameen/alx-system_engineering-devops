# trafic increase to ngnix server

# increase ULIMIT of the default file
exec { 'fix--for-nginx':
  command => 'bin/sed -i "s/15/4096/" /etc/default/nginx',
  path    => 'usr/local/bin/:/bin/',
}

exec { 'nginx-restart':
  command => 'etc/init.d/nginx restart',
  path    => 'etc/init.d/',
}
