require_relative 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at, :title

  def initialize(title, publish_date, multiplayer, last_played_at, genre)
    super(publish_date)
    @title  = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @genre = genre
  end

  def can_be_archived?
    @last_played_at < 2.year.ago
  end
end
