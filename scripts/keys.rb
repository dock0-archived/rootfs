##
# Add SSH keys

require 'uri'
require 'fileutils'

path = "#{@paths[:build]}/root/.ssh/authorized_keys"
keys = URI.open(@config[:keys][:url]).read

FileUtils.mkdir_p File.dirname(path)

File.open(path, 'w') { |fh| fh << keys }
