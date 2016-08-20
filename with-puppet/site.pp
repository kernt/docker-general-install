include 'docker'

docker::image { 'ubuntu': }

docker::image { 'ubuntu':
  ensure => 'absent',
}

docker::run { 'helloworld':
  image        => 'ubuntu',
  command      => '/bin/sh -c "while true; do echo hello world; sleep 1; done"',
  ports        => ['4444', '4555'],
  volumes      => ['/var/lib/couchdb', '/var/log'],
  #volumes_from => '6446ea52fbc9',
  #memory_limit => 10485760, # bytes
  username     => 'example',
  hostname     => 'example.com',
  #env          => ['FOO=BAR', 'FOO2=BAR2'],
  dns          => ['8.8.8.8', '8.8.4.4'],
}
