# Puppet manifest to install Flask from pip3

# Ensure the package is present
package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

