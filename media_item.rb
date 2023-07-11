class MediaItem
  attr_accessor :title, :artist, :genre

  def initialize(title, artist, genre)
    @title = title
    @artist = artist
    @genre = genre
  end

  def can_be_archived?
    false
  end
end
