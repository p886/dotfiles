#! /usr/bin/env ruby

# default location for dotfiles is $HOME
destination_paths = Hash.new(Dir.home)

# name of entries withing dotfiles dir; without current dir (.) and parent dir (..)
dotfiles = Dir.entries("dotfiles").reject { |entry| (entry == '.' || entry == '..') }

dotfiles.each do |dotfile|
  source = File.join(File.expand_path('../dotfiles', __FILE__), dotfile)
  destination = File.join(destination_paths[dotfile], '.' + dotfile)

  unless File.exist?(destination)
    File.symlink(source, destination)
    puts "created symlink for #{dotfile}"
  end
end
