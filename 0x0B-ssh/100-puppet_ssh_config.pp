# ssh_config.pp

file_line { 'Turn off passwd auth':
  path  => '/home/abu/.ssh/config',
  line  => 'PasswordAuthentication no',
}

file_line { 'Declare identity file':
  path  => '/home/abu/.ssh/config',
  line  => 'IdentityFile ~/.ssh/school',
}

