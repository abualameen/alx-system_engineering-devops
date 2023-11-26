# Puppet manifest to send SIGTERM to a process

exec { 'send_ctrl_d':
  command => '/usr/bin/pkill -15 killmenow',
}
