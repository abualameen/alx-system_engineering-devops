# This Puppet manifest kills a process named "killmenow" using pkill with full path

exec { 'killmenow':
  command     => '/usr/bin/pkill -TERM -f "killmenow"',
  refreshonly => true,
}
