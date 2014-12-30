##
# Install tarball packages onto system

require 'open-uri'
require 'tempfile'

@config['tarballs'].each do |tarball|
  package = tarball['package']
  version = tarball['version'] || 'latest'
  org = tarball['org'] || @config['org']
  url = tarball['url'] || "https://github.com/#{org}/#{package}/releases/download/#{version}/#{package}.tar.gz"

  file = Tempfile.new(package)

  open(url, 'rb') { |request| file.write request.read }
  file.close

  `tar -xzkv -C #{@paths['build']}/ -f #{file.path}`
end
