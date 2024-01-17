# Puppet Manifest for fixing Apache issue identified with strace
# File: 0-strace_is_your_friend.pp

# Define a Puppet exec resource to fix the issue
exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/',
}

