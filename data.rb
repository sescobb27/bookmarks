module DataBookmark
  load 'bookmark_database.rb'
  Uri = Struct.new(:desc, :url) do
    def to_h
      {
        desc: @desc,
        url: @url
      }
    end
  end

  @@categories = { 
    ruby: [],
    android: [],
    books: [],
    html_css: [],
    tutorials: [],
    git: [],
    js: [],
    other: []
  }

  @@data = {
    categories: @@categories
  }

  class << self
    def data(params = {})
      @@data
    end

    def categories()
      @@categories
    end

    def add_category(category)
      @@categories[category.to_sym] = []
    end

    def merge!
      @@data[:categories].merge! @@categories
      save
    end

    private
      def get_all_bookmarks
        DB[:bookmarks]
      end
      def save
        all_bookmarks = get_all_bookmarks
        dataset_query = all_bookmarks.select_map(:url)
        @@data[:categories].each_pair do |category, uri_array|
          uri_to_insert = exclude_from dataset_query, uri_array
          uri_to_insert.each do |uri|
            all_bookmarks.insert url: uri[:url],
                        desc: uri[:desc],
                        category: category.to_s
          end
        end
      end

      def exclude_from(dataset_query, uri_array)
        uri_array.select do |uri|
          not dataset_query.include? uri[:url]
        end
      end
  end

end