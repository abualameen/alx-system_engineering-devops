# This Puppet manifest kills a process named "killmenow" using pkill

exec { 'killmenow':
  command     => 'pkill -SIGTERM killmenow',
  path        => ['/bin', '/usr/bin', '/usr/sbin', '/sbin'],
  onlyif      => 'pgrep killmenow',
  refreshonly => true,
}
