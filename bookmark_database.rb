require "sequel"

def create_bookmarks
  DB.create_table? :bookmarks do |db|
    # db.primary_key :id
    # db.String :url
    # db.String :desc
    # db.String :category
    column :url, String, null: false, index: { unique: true, name: 'url_index' }
    column :desc, String
    column :category, String, null: false, index: { unique: true, name: 'category_index' }
  end
end

def drop_bookmarks
  DB.drop_table :bookmarks
end

begin
  DB = Sequel.sqlite "#{ENV['HOME']}/bookmark.db"
  create_bookmarks
rescue Sequel::DatabaseError => ex
  puts ex.message
end