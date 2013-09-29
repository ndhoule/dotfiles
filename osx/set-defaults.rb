#!/usr/bin/env ruby

#
# Sets sane defaults for Mac OS X.
#
# Authors:
#   Nathan Houle <nathan@nathanhoule.com>
#
# With liberal help from Mathias Bynens:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#

CWD = File.expand_path(File.dirname(__FILE__))
SCRIPTS_DIR = File.join(CWD, 'scripts')

AFFECTED_APPS = [
 "Dashboard",
 "Dock",
 "Finder",
 "Safari",
 "SystemUIServer",
 "Terminal"
]

def kill_app (app)
  system("killall #{app} > /dev/null 2>&1")
end

abort("This script can only be run on Mac OS X") if not RUBY_PLATFORM.downcase.include?("darwin")

puts <<EOF
OS X Settings
=============
Warning: This script will wipe out many of OS X' default settings and replace
them with sane defaults.
EOF

print "Are you sure you want to change your OS X settings? (Y to proceed): "
abort("Exiting...") if not gets.chomp =~ /[Yy]/

print "\n"

Dir.glob("#{SCRIPTS_DIR}/*").each do |f|
  puts "Running #{File.basename(f)}..."
  system("/usr/bin/env #{f}")
end
print "\n"

# Clean up and restart affected applications
puts "Reloading affected applications..."
print "\n"
AFFECTED_APPS.each { |app| kill_app app }

puts <<EOF
Finished setting OS X defaults. Note that some of these changes require a
logout/restart to take effect.
EOF
