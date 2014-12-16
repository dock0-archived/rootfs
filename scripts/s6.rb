##
# Install s6 as the init system

require 'open-uri'
require 'tempfile'

['execline', 's6', 's6-linux-utils'].each do |package|
  version = @config['versions'][package]
  url = "https://github.com/akerl/#{package}/releases/download/#{version}/#{package}.tar.gz"
  file = Tempfile.new(package)

  open(url, 'rb') { |request| file.write request.read }
  file.close

  `tar -xzkv -C #{@paths['build']}/ -f #{file.path}`
end
