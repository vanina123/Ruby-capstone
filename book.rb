require_relative 'item'

class Book < Item
  attr_accessor :publish_date, :title, :first_name, :last_name, :cover_state, :genre, :archived

  def initialize(publish_date, title, first_name, last_name, cover_state, genre, label, _archived)
    super(publish_date)
    @title = title
    @first_name = first_name
    @last_name = last_name
    @cover_state = cover_state
    @genre = genre
    @label = label
  end

  def can_be_archived?
    return true if archived == true or cover_state == 'bad'
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
end
