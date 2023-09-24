# Puppet manifest to configure SSH client
include stdlib
# Define a resource for the SSH client configuration file
file_line { 'Configure SSH client':
  path => '/home/abu/.ssh/config', 
  line => [
    'Host *',
    'IdentityFile ~/.ssh/school',
    'PasswordAuthentication no',
  ],
}

