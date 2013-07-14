#!/usr/bin/env ruby
$LOAD_PATH << "."
require "thor"
require "data"
class Bookmark < Thor
  
  desc 'add CATEGORY DESCRIPTION URL','agrega un nuevo bookmark'
  def add( category, desc, url )
    if 
  end
end

Bookmark.start ARGV