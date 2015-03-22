#!/usr/bin/env ruby

files = {
  'config/dot.laptop.local' => '~/.laptop.local',
  'config/dot.gitignore_global' => '~/.gitignore_global'
}

files.each do |file, link_path|
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
    'ohmyzsh'  => 'curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh',
    'alcatraz' => 'curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh'
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
