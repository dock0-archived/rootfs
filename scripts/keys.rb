##
# Add SSH keys

require 'open-uri'
require 'fileutils'

path = "#{@paths[:build]}/root/.ssh/authorized_keys"
keys = open(@config[:keys][:url]).read

File.open(path, 'w') { |fh| fh << keys }
