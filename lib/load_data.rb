require 'json'
require_relative '../genre'
require_relative '../music_album'
require_relative '../game'
require_relative '../author'
require_relative '../book'
require_relative '../label'

def load_music_album
  return [] if File.exist?('files/music_album.json') == false

  new_arr = []
  file = File.read('files/music_album.json')
  file_data = JSON.parse(file)
  file_data.each do |album|
    new_arr << MusicAlbum.new(album['title'], album['artist'], album['genre'])
  end
  new_arr
end

def load_genre
  return [] if File.exist?('files/genre.json') == false

  new_arr = []
  file = File.read('files/genre.json')
  file_data = JSON.parse(file)
  file_data.each do |genre|
    new_arr << Genre.new(genre['name'], genre['item'])
  end
  new_arr
end

def load_author
  return [] if File.exist?('files/author.json') == false

  new_arr = []
  file = File.read('files/author.json')
  file_data = JSON.parse(file)
  file_data.each do |author|
    new_arr << Author.new(author['first_name'], author['last_name'])
  end
  new_arr
end

def load_game
  return [] if File.exist?('files/game.rjson') == false

  new_arr = []
  file = File.read('files/game.json')
  file_data = JSON.parse(file)
  file_data.each do |game|
    new_arr << Game.new(game['multiplayer'], game['last_played_at'])
  end
  new_arr
end

def load_book
  return [] if File.exist?('files/book.rjson') == false

  new_arr = []
  file = File.read('files/book.json')
  file_data = JSON.parse(file)
  file_data.each do |book|
    new_arr << Book.new(
      book['publish_date'],
      book['title'],
      book['author'],
      book['cover_state'],
      book['genre']
    )
  end
  new_arr
end

def load_label
  return [] if File.exist?('files/label.rjson') == false

  new_arr = []
  file = File.read('files/label.json')
  file_data = JSON.parse(file)
  file_data.each do |label|
    new_arr << Label.new(
      label['title'],
      label['items'].map { |item_hash| Item.new(item_hash['name']) }
    )
  end
  new_arr
end