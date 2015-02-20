#! /usr/bin/env ruby

# default location for dotfiles is $HOME
destination_paths = Hash.new(Dir.home)

dotfiles_dir = File.expand_path('../dotfiles', __FILE__)

# name of entries withing dotfiles dir; without current dir (.) and parent dir (..)
dotfiles = Dir.entries(dotfiles_dir).reject { |entry| (entry == '.' || entry == '..') }

dotfiles.each do |dotfile|
  source = File.join(dotfiles_dir, dotfile)
  destination = File.join(destination_paths[dotfile], '.' + dotfile)

  unless File.exist?(destination)
    File.symlink(source, destination)
    puts "created symlink for #{dotfile} at #{destination}"
  end
end
