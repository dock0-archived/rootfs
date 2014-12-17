##
# Remove extra users and files

require 'fileutils'

cleanup = @config['cleanup']

cleanup['users'].each do |user|
  puts "Removing user: #{user}"
  run_chroot "userdel #{user}"
end

cleanup['paths'].each do |path|
  puts "Removing path: #{path}"
  FileUtils.rm_rf "#{@paths['build']}/#{path}"
end

cleanup['packages'].each do |package|
  puts "Removing package: #{package}"
  run_chroot "pacman -Rdd #{package}"
end

run_chroot 'pacman -Scc --noconfirm'
run_chroot 'find /usr/share/locale/ ' \
  '-maxdepth 1 -mindepth 1 -type d ! -name "en_US" ' \
  '-exec rm -r {} \;'
