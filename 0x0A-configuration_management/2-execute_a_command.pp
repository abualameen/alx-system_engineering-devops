# This Puppet manifest kills a process named "killmenow" using pkill

exec { 'killmenow':
  command     => '/usr/bin/pkill -TERM -f "killmenow"',
  refreshonly => true,
}
