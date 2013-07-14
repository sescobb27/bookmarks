#!/usr/bin/env ruby
$LOAD_PATH << "."
require "thor"
require "data"
class Bookmark < Thor
  
  desc 'add CATEGORY DESCRIPTION URL','agrega un nuevo bookmark'
  def add( cat, desc, url )
    category = cat.downcase.to_sym
    if DataBookmark::categories.has_key? category
      new_bookmark_uri = DataBookmark::Uri.new desc, url
      DataBookmark::categories[category] << new_bookmark_uri
      DataBookmark::merge!
    end
  end
end

Bookmark.start ARGV