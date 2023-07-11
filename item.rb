class Item
  attr_accessor :published_date, :genre, :label, :author

  def initialize(genre, author, label, publish_date, archived: true)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    @publish_date < 10.year.ago
  end

  def move_to_archive
    @archived = true if can_be_archived == true
  end
end
