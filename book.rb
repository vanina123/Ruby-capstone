require_relative 'item'

class Book < Item
  attr_accessor :publish_date, :title, :author, :cover_state, :genre

  def initialize(publish_date, title, author, cover_state, genre)
    super(publish_date)
    @title = title
    @author = author
    @cover_state = cover_state
    @genre = genre
  end

  def to_hash
    {
      publish_date: @publish_date,
      title: @title,
      author: @author,
      cover_state: @cover_state,
      genre: @genre
    }
  end

  def self.new_from_hash(hash)
    new(
      hash['publish_date'],
      hash['title'],
      hash['author'],
      hash['cover_state'],
      hash['genre']
    )
  end
end
