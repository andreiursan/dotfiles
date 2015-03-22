files = {
  'config/dot.laptop.local' => '~/.laptop.local'
}

files.each do |file, link_path|
  system("ln -sfv #{Dir.pwd}/#{file} #{link_path}")
end
