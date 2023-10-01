# setup a nginx web server on our server + redirection.
package { 'nginx':
  ensure   => present,
  provider => 'apt'
}

file { '/var/www/html/index.html':
  ensure  => present,
  path    => '/var/www/html/index.html',
  content => 'Hello World!'
}

file_line { 'Lmorphine - Morphiniya 7':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => '        rewrite ^/redirect_me https://www.youtube.com/watch?v=KfWAmnRWEKE permanent;'
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  require    => Package['nginx'],
  subscribe  => File_line['Lmorphine - Morphiniya 7']
}
