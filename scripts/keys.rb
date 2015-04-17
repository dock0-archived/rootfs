##
# Add SSH keys

require 'fileutils'
require 'tmpdir'

def list_keys(path)
  Dir.glob("#{path}/**/*").select { |x| File.file? x }
end

def load_keys(path)
  list_keys(path).map { |x| File.readlines x }.flatten.uniq
end

def fetch_keys
  Dir.mktmpdir('keyrepo') do |dir|
    `git clone #{@options[:keys][:repo]} #{dir}`
    group_path = File.join(dir, @options[:keys].fetch(:group, 'default'))
    load_keys(group_path)
  end
end

path = "#{@paths[:build]}/root/.ssh/authorized_keys"

FileUtils.mkdir_p File.dirname(path)
File.open(path, 'wb') do |fh|
  fetch_keys.each { |key| fh << key + "\n" }
end
