##
# Install tarball packages onto system

require 'open-uri'
require 'tempfile'

DEFAULT_URL = 'https://github.com/' \
  '%{org}/%{package}/' \
  'releases/download/' \
  '%{version}/%{package}.tar.gz'

@config.fetch(:tarballs, []).each do |tarball|
  tarball[:version] ||= 'latest'
  tarball[:org] ||= @config[:org]
  tarball[:url] ||= DEFAULT_URL % tarball

  file = Tempfile.new(package)

  puts "Downloading #{package}"
  open(url, 'rb') { |request| file.write request.read }
  file.close

  `tar -xzkv -C #{@paths[:build]}/ -f #{file.path}`
end
