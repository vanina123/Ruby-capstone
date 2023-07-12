require_relative 'genre'
require_relative 'book'
require_relative 'author'
require_relative 'label'
require_relative 'item'
require_relative 'music_album'
require_relative 'game'
require_relative 'lib/save_data'
require_relative 'lib/load_data'
require_relative 'lib/saves_data'
require_relative 'lib/loads_data'

class App
    def initialize
        @music_albums = load_music_album
        @genres = load_genre
        @authors = load_author
        @games = load_game
        @labels = load_label
        @books = load_book
    end

    def list_all_books
        @book.each do |book|
            puts "#{book.publish_date} Title: #{book.title} by #{book.author} cover_state: #{book.cover_state} Genre: #{book.genre}"
        end
    end

    def list_all_music_albums
        @music_albums.each do |music_album|
            puts "#{music_album.title} by: #{music_album.artist} Genre: #{music_album.genre} spotify: #{music_album.on_spotify}"
        end
    end

    # def list_all_movies
    # end

    def list_all_games
        @games.each do |game|
            puts "#{game.publish_date} #{game.multiplayer} #{game.last_played_at}"
        end
    end

    def list_all_genre
        @genres.each do |genre|
            puts "#{genre.name}"
        end
    end

    def list_all_labels
        @labels.each do |label|
            puts "#{label.title}"
        end
    end

    def list_all_authors
        @authors.each do |author|
            puts "#{author.first_name} #{author.last_name}"
        end
    end

    def get_user_input(prompt)
        print prompt
        gets.chomp
    end

    def add_book
        print 'Publish date in this format yyyy/mm/dd:'
        publish_date = gets.chomp
        print 'Title:'
        title = gets.chomp
        print 'First name of the Author:'
        first_name = gets.chomp
        print 'Last name of the Author:'
        last_name = gets.chomp
        print 'cover_state'
        cover_state = gets.chomp
        print 'genre:'
        genre = gets.chomp
        newGenre = Genre.new(genre)
        newAuthor = Author.new(first_name,last_name)
        book = Book.new(publish_date, title, newAuthor, cover_state, genre)
        @books << book
        if @genre.include? genre == false
            @genre << newGenre
        end
        if @author.include? newAuthor == false
            @author << newAuthor
        end
        puts 'Book created successfully'
    end

    def add_music_album
        print 'The name of the title:'
        title = gets.chomp
        print 'The name of the artist:'
        artist = gets.chomp
        print 'The genre of the album:'
        genre = gets.chomp
        print 'is it on spotify?[Y,N]'
         spotify = gets.chomp
         if spotify == "Y" or 'y'
            on_spotify = true
         else 
            on_spotify = false
            end
            newGenre = Genre.new(genre)
            music = MusicAlbum.new(title, artist, newGenre, on_spotify)
            if @genre.include? genre == false
                @genre << newGenre
            end
        @music << music
    end

    def add_game
    end

    def quit
    end

end
