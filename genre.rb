class Genre
    attr_accessor :name, :items
  
    def initialize(name)
      @name = name
      @items = []
    end
  
    def add_item(item)
      @items << item
      item.genre = self
    end
  
    def list
      @items.map(&:title)
    end
end
  