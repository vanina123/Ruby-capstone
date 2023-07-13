require_relative '../music_album'

RSpec.describe MusicAlbum do
  describe '#to_hash' do
    it 'returns a hash representation of the music album' do
      album = MusicAlbum.new('freedom', 'Album', 'Pop', true, 'gift')

      expect(album.title).to eq('freedom')
      expect(album.artist).to eq('Album')
      expect(album.genre).to eq('Pop')
      expect(album.on_spotify).to be(true)
    end
  end
end
