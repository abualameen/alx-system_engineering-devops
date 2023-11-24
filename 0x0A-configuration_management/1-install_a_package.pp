# Puppet manifest to install Flask from pip3 with specific Python version

# Install the python3-pip package
package { 'python3-pip':
  ensure => installed,
}

# Install Flask and Werkzeug
exec { 'install_flask':
  command => 'pip3 install Flask==2.1.0 Werkzeug==2.1.1',
  path    => ['/usr/bin'],
  require => Package['python3-pip'],
}
