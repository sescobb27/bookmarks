require "sequel"

begin
  DB = Sequel.sqlite "#{ENV['HOME']}/bookmark.db"
  DB.create_table :bookmarks do |db|
    db.primary_key :id
    db.String :url
    db.String :desc
  end
rescue Sequel::DatabaseError => ex
  puts ex.message
ensure
  BOOK = DB[:bookmarks]
end