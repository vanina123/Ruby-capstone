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

    def can_be_archived?()
        if @publish_date < 10.year.ago
        true
        else
        false
        end
    end

    def move_to_archive()
        if can_be_archived == true
            @archived = true
        end
    end
end
        