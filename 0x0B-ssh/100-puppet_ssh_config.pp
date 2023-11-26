# ssh_config.pp

file { '/home/abu/.ssh/config':
  ensure  => present,
  content => "
Host *
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
  ",
  mode    => '0600',
  owner   => 'abu',
  group   => 'abu',
}

