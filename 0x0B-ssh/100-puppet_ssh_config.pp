# ssh_config.pp

file { '/home/abu/.ssh/config':
  ensure  => present,
  content => "Host *\n    IdentityFile ~/.ssh/school\n    PasswordAuthentication no\n",
  mode    => '0600',
  owner   => 'abu',
  group   => 'abu',
}

