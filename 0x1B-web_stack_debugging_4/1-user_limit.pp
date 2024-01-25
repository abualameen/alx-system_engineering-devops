# enable the user holberton to login and open files without errors.

exec { 'increase-hard-file-limit-for-holberton-user':
  command => "sed -i '/^holberton hard/s/5/50000/' /etc/security/limits.conf",
  path    => '/usr/local/bin/:/bin/'
}

exec { 'increase-hard-file-limit-for-holberton-user':
  command => 'sed -i "/^holberton soft/s4/50000/" etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
}
