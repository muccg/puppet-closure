#
class closure {
  package { ['unzip', 'java-1.7.0-openjdk']:
    ensure => 'installed'
  }
  
  exec { 'install closure compiler':
    cwd => '/root',
    command => '/bin/mkdir /usr/local/closure.$$ && cd /usr/local/closure.$$ && /usr/bin/wget http://dl.google.com/closure-compiler/compiler-latest.zip && /usr/bin/unzip compiler-latest.zip && /bin/chmod 644 compiler.jar && /bin/mv /usr/local/closure.$$ /usr/local/closure',
    require => Package[['unzip', 'java-1.7.0-openjdk']],
    unless => '/usr/bin/test -d /usr/local/closure'
  }
}
