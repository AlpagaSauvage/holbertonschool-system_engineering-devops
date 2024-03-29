# Fix a bug

# Increase the limit of for the amout of request at the same time
exec { 'fix-request-limit':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/'
}

# Restart Nginx
exec { 'restart nginx':
  require => Exec['fix-request-limit'],
  command => 'nginx restart',
  path    => '/etc/init.d/'
}
