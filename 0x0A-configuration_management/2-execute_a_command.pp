# Puppet manifest to kill a specific process using its name

exec { 'kill_killmennow':
  command     => '/usr/bin/pkill killmennow',
  provider    => 'shell',
  returns     => [0, 1],
}

