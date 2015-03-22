#!/usr/bin/env ruby

def config_files
  {
    'config/dot.laptop.local'     => '~/.laptop.local',
    'config/dot.gitignore_global' => '~/.gitignore_global',
    'config/dot.gitconfig'       => '~/.gitconfig'
  }
end

config_files.each do |file, link_path|
  system("ln -sfv #{Dir.pwd}/#{file} #{link_path}")
end

#
# Alcatraz: http://alcatraz.io/
# Ohmyzsh:  http://ohmyz.sh/
# Laptop:   https://github.com/thoughtbot/laptop
#

def tools
  {
    'laptop'   => './tools/laptop.sh',
    'ohmyzsh'  => './tools/ohmyzsh.sh',
    'alcatraz' => './tools/alcatraz.sh'
  }
end

def install(tool)
  res = system(tools[tool])
  notification = res ? "#{tool.capitalize} installed!" :
                       "Something went wrong with the installation of #{tool}!"
  puts notification
end

if ARGV.include?("--first-setup")
  tools.keys.each { |tool| install(tool) }
end

ARGV.each do |maybe_tool|
  if tools.keys.include?(maybe_tool)
    install(maybe_tool)
  end
end
