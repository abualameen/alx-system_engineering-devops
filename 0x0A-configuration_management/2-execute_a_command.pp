# Puppet manifest to start and stop the killmenow process

# Exec to start the process and capture PID
exec { 'start_killmenow':
  command => '/path/to/start_killmenow.sh',
  creates => '/tmp/killmenow_pid', # Ensure the PID file is created
}

# Exec to stop the process
exec { 'stop_killmenow':
  command => '/usr/bin/test -f /tmp/killmenow_pid && kill -2 $(cat /tmp/killmenow_pid) || true',
  onlyif  => '/usr/bin/test -f /tmp/killmenow_pid',
  notify  => Notify['process_termination_message'],
}

# Notify to print the termination message
notify { 'process_termination_message':
  message   => 'Terminated',
  subscribe => Exec['stop_killmenow'],
}
