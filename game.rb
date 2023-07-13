require_relative 'item'
require 'date'
class Game < Item
  attr_accessor :multiplayer, :last_played_at, :title

  def initialize(title, publish_date, multiplayer, last_played_at, genre, label)
    super(publish_date)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @genre = genre
    @label = label
  end

  def can_be_archived?
    today = Date.today
    Date.new(today.year - 2, today.month, today.day)
  end
end
