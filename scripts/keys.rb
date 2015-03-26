##
# Add SSH keys

require 'fileutils'
require 'open-uri'

keys = @config.fetch(:keys, []).map do |url|
  open(url, 'rb') { |req| req.read }
end
path = "#{@paths[:build]}/root/.ssh/authorized_keys"

FileUtils.mkdir_p File.dirname(path)
File.open(path, 'wb') do |fh|
  keys.each { |key| fh << key + "\n" }
end

