class phantomjs($version = "1.8.1" ) {

  if $::architecture == "amd64" or $::architecture == "x86_64" {
    $platid = "x86_64"
  } else {
    $platid = "i686"
  }

  $base_filename = "phantomjs-${version}-linux-${platid}"
  $filename = "${base_filename}.tar.bz2"
  $phantom_bin_path = "/usr/local/bin/phantomjs-${version}"

  exec { "download-${filename}" :
    command => "wget -O - http://phantomjs.googlecode.com/files/${filename} | tar xvjf - ${base_filename}/bin/phantomjs -O > ${phantom_bin_path}",
    creates => "${phantom_bin_path}",
    path    => "/usr/bin:/bin",
  }

  file { "$phantom_bin_path":
    ensure  => present,
    mode    => "0755",
    subscribe => Exec["download-${filename}"],
  }

  file { "/usr/bin/phantomjs" :
    target  => $phantom_bin_path,
    ensure  => link,
    require => File["$phantom_bin_path"],
  }
}
