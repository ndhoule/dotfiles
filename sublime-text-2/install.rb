#!/usr/bin/env ruby

require 'fileutils'
require 'net/http'

HOME = Dir.home
CWD = File.expand_path(File.dirname(__FILE__))
ST2_DIR = '/Applications/Sublime Text 2.app'
ST2_BINARY = File.join(ST2_DIR, 'Contents/SharedSupport/bin/subl')
SUBL_PATH = File.join(HOME, '/bin/subl')
ST2_CONFIG_DIR = File.join(HOME, 'Library/Application Support/Sublime Text 2')
ST2_USER_DIR = File.join(ST2_CONFIG_DIR, 'Packages/User')
ST2_PACKAGE_DIR = File.join(ST2_CONFIG_DIR, 'Installed Packages')

if not File.exists?(ST2_DIR)
  abort('Sublime Text 2 is not installed. Aborting install script...')
end

puts 'Installing Sublime Text 2 settings...'

# Symlink the subl binary into place
if not File.exists?(SUBL_PATH)
  File.symlink(ST2_BINARY, SUBL_PATH)
end

# Ensure the destination directory exists
FileUtils.mkdir_p(ST2_CONFIG_DIR)

# Back up any pre-existing User directory
if File.exists?(ST2_USER_DIR)
  dest = File.join(ST2_CONFIG_DIR, 'User.bak')

  if File.exists?(dest)
    FileUtils.rm_r(dest)
  end

  FileUtils.mv(ST2_USER_DIR, dest)
end

# Symlink the user settings folder
File.symlink(File.join(CWD, 'Packages/User'), ST2_USER_DIR)

# Install Package Control
Net::HTTP.start('sublime.wbond.net') do |http|
  resp = http.get('/Package Control.sublime-package')
  open(File.join(ST2_PACKAGE_DIR, 'Package Control.sublime-package'), 'wb') do |file|
    file.write(resp.body)
  end
end

puts "Sublime Text 2 settings installed."
