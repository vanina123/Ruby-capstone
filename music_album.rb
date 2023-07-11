require_relative 'media_item'

class MusicAlbum < MediaItem
    attr_accessor :title, :artist, :genre, :on_spotify
  
    def initialize(title, artist, genre, on_spotify)
      super(title, artist, genre)
      @on_spotify = on_spotify
    end
  
    def can_be_archived?
      return true if super && on_spotify
      false
    end
  
    def self.list
      all.select { |album| album.class == MusicAlbum }
    end
  
    def self.add(title, artist, genre, on_spotify)
      new(title, artist, genre, on_spotify)
    end
end
  