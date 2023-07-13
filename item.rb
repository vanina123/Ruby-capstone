require 'date'

class Item
  attr_accessor :publish_date, :genre, :label, :author, :id

  def initialize(publish_date, archived: true)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre.name
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author.first_name
    author.items.push(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label.title
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    today = Date.today
    Date.new(today.year - 10, today.month, today.day)
  end

  def move_to_archive
    @archived = true if can_be_archived == true
  end
end
