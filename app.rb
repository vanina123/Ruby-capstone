require_relative 'genre'
require_relative 'book'
require_relative 'author'
require_relative 'label'
require_relative 'item'
require_relative 'music_album'
require_relative 'game'
require_relative 'lib/save_data'
require_relative 'lib/load_data'

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
            puts "title: #{music_album.title} by: #{music_album.artist} Genre: #{music_album.genre.name} spotify: #{music_album.on_spotify}"
        end
    end

    def list_all_games
        @games.each do |game|
            puts "title: #{game.title} published date: #{game.publish_date} is it multiplayer: #{game.multiplayer} the last time game played: #{game.last_played_at}"
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
        print 'cover_state:'
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
        print 'is it on spotify?[Y,N]:'
         spotify = gets.chomp
         if spotify == "Y" or 'y'
            on_spotify = true
         else 
            on_spotify = false
            end
            newGenre = Genre.new(genre)
            music = MusicAlbum.new(title, artist, newGenre, on_spotify)

        @music_albums << music
        puts "the music album has been added"
    end

    def add_game
        print 'The title of the game:'
        title = gets.chomp
        print 'The published date of the game:'
        publish_date = gets.chomp
        print "is it a multiplayer game?[Y,N]:"
        answer = gets.chomp
        if answer == "Y" or 'y'
            multiplayer = true
         else 
            multiplayer = false
            end
        print 'The genre of the album:'
        genre = gets.chomp
        newGenre = Genre.new(genre)
        game = Game.new(title,publish_date, multiplayer, newGenre)
        if @genre.include? genre == false
            @genre << newGenre
        end
        @game << game
    end

    def quit

        puts 'existing the app. Goodbye'
        save_music_albums(@music_albums)
        save_genre(@genres)
        save_author(@authors)
        save_game(@games)
        save_book(@books)
        save_label(@labels)
       exit
    end

    def save_music_albums(arr)
        new_arr = []
        music_albums.each do |album|
          obj = {
            title: album.title,
            artist: album.artist,
            genre: album.genre
          }
          new_arr << obj
        end
        save(new_arr, 'music_albums')
    end

    def save_genre(arr)
        new_arr = []
        genres.each do |genre|
          obj = {
            name: genre.name,
            item: genre.item
          }
          new_arr << obj
        end
        save(new_arr, 'genre')
    end

    def save_author(arr)
        new_arr = []
        authors.each do |author|
          obj = {
            first_name: author.first_name,
            last_name: author.last_name
          }
          new_arr << obj
        end
        save(new_arr, 'author')
    end

    def save_game(arr)
        new_arr = []
        games.each do |game|
          obj = {
            multiplayer: game.multiplayer,
            last_played_at: game.last_played_at
          }
          new_arr << obj
        end
        save(new_arr, 'game')
    end

    def save_book(arr)
        new_arr = []
        books.each do |book|
          obj = {
            publish_date: book.publish_date,
            title: book.title,
            author: book.author,
            cover_state: book.cover_state,
            genre: book.genre
          }
          new_arr << obj
        end
        save(new_arr, 'book')
    end

    def save_label(arr)
        new_arr = []
        labels.each do |label|
          obj = {
            title: label.title,
            items: label.items.map { |item| { name: item.name } }
          }
          new_arr << obj
        end
        save(new_arr, 'label')
    end
  
end
