require_relative 'item'

class Book < Item
  attr_accessor :publish_date, :title, :first_name, :last_name, :cover_state, :genre

  def initialize(publish_date, title, first_name, last_name, cover_state, genre, label)
    super(publish_date)
    @title = title
    @first_name = first_name
    @last_name = last_name
    @cover_state = cover_state
    @genre = genre
    @label = label
  end

  def to_hash
    {
      publish_date: @publish_date,
      title: @title,
      first_name: @first_name,
      last_name: @last_name,
      cover_state: @cover_state,
      genre: @genre,
      label: @label
    }
  end

  def self.new_from_hash(hash)
    new(
      hash['publish_date'],
      hash['genre']
    )
  end
end
