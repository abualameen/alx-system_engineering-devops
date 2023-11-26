# ssh_config.pp

file { '/etc/ssh/sshd_config':
  ensure => present,
}

file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/sshd_config',
  line  => 'PasswordAuthentication no',
  match => '^#?PasswordAuthentication ',
}

file_line { 'Declare identity file':
  path  => '/etc/ssh/sshd_config',
  line  => 'IdentityFile ~/.ssh/school',
  match => '^#?IdentityFile ',
}

