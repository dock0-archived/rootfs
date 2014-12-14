##
# Configure the root user's environment

require 'fileutils'

# Disable password authentication
shadow_path = "#{@paths['build']}/etc/shadow"
shadow_file = File.readlines shadow_path
shadow_file.first.gsub! 'root::', 'root:x:'
File.open(shadow_path, 'w') { |fh| shadow_file.each { |line| fh << line } }

# Set timezone
FileUtils.ln_s(
  '../usr/share/zoneinfo/UTC',
  "#{@paths['build']}/etc/localtime"
)

# Generate locales
run_chroot 'locale-gen'
