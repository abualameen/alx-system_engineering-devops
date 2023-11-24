# Puppet manifest to kill a specific process using its PID

exec { 'killmenow':
  command     => '/usr/bin/pkill killmenow',
  provider    => 'shell',
  returns     => [0, 1],
}


