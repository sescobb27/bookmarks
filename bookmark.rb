#!/usr/bin/env ruby
$LOAD_PATH << "."
require "thor"
require "data"
class Bookmark < Thor
  
  desc 'add CATEGORY DESCRIPTION URL','agrega un nuevo bookmark'
  def add( category, desc, url )
    if DataBookmark::categories.has_key? category.to_sym
      new_bookmark_uri = DataBookmark::Uri.new desc, url
      DataBookmark::categories[category.to_sym] << new_bookmark_uri
      DataBookmark::merge!
    end
  end
end

Bookmark.start ARGV