# Puppet manifest to configure SSH client
file_line { 'Configure SSH client':
  path   => '/home/abu/.ssh/config',
  line   => "Host *
IdentityFile ~/.ssh/school
PasswordAuthentication no",
ensure => present,
}


