require 'json'
require_relative '../genre'
require_relative '../music_album'

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