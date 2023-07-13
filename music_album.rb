require_relative 'media_item'

class MusicAlbum < MediaItem
  attr_accessor :title, :artist, :genre, :on_spotify, :label, :id

  def initialize(title, artist, genre, on_spotify, label)
    super(title, artist, genre)
    @id = Random.rand(1...1000)
    @on_spotify = on_spotify
    @label = label
  end

  def can_be_archived?
    return true if super && on_spotify

    false
  end

  def self.list
    all.select { |album| album.instance_of?(MusicAlbum) }
  end

  # def self.add(title, artist, genre, on_spotify,label)
  #   new(title, artist, genre, on_spotify,label)
  # end
end
