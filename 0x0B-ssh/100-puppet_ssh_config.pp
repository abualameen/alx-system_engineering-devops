# ssh_config.pp

file { '/home/abu/.ssh/config':
  ensure => present,
}

file_line { 'Turn off passwd auth':
  path  => '/home/abu/.ssh/config',
  line  => 'PasswordAuthentication no',
  match => '^#?PasswordAuthentication ',
}

file_line { 'Declare identity file':
  path  => '/home/abu/.ssh/config',
  line  => 'IdentityFile ~/.ssh/school',
  match => '^#?IdentityFile ',
}

