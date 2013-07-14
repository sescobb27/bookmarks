module DataBookmark
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
    end
  end

end