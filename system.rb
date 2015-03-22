#!/usr/bin/env ruby

### CONFIG FILES ###
def config_files
  {
    'config/dot.laptop.local'     => '~/.laptop.local',
    'config/dot.gitignore_global' => '~/.gitignore_global',
    'config/dot.gitconfig'        => '~/.gitconfig'
  }
end

def link_config_files
  config_files.each do |file, link_path|
    system("ln -sfv #{Dir.pwd}/#{file} #{link_path}")
  end
end

### TOOLS ###
def system_tools
  {
    'laptop'   => './tools/laptop.sh',
    'ohmyzsh'  => './tools/ohmyzsh.sh',
    'alcatraz' => './tools/alcatraz.sh'
  }
end

def install_tools(tools)
  tools.each do |tool|
    ok = system(system_tools[tool])
    puts "[#{tool}] installation was #{ok ? 'successful' : 'unsuccesful'}!"
  end
end

### Putting it all together ###
def execute(options)
  link_config_files
  if options.include?("--first-setup")
    install_tools(system_tools.keys)
  else
    install_tools(options.compact)
  end
end

execute(ARGV)
