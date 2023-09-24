# Puppet manifest to configure SSH client
file_line { 'Configure SSH client':
  path   => '/home/abu/.ssh/config',
  line   => "Host *\nIdentityFile ~/.ssh/school\nPasswordAuthentication no",
  ensure => present,
}


