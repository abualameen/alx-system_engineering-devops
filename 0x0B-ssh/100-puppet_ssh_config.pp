# ssh_config.pp

file { '/home/abu/.ssh/config':
  ensure  => present,
  content => "Host *\n    IdentityFile ~/.ssh/school\nPasswordAuthentication no\n",
  mode    => '0600',
  owner   => 'abu',
  group   => 'abu',
}

file_line { 'Turn off passwd auth':
  path  => '/home/abu/.ssh/config',
  line  => 'PasswordAuthentication no',
}

file_line { 'Declare identity file':
  path  => '/home/abu/.ssh/config',
  line  => 'IdentityFile ~/.ssh/school',
}

