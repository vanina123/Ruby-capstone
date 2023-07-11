require_relative '../music_album'


RSpec.describe MusicAlbum do
  describe '#to_hash' do
    it 'returns a hash representation of the music album' do
      album = MusicAlbum.new('Album 1', 'Pop', true)
      hash = album.to_hash

      expect(hash).to be_a(Hash)
      expect(hash[:name]).to eq('Album 1')
      expect(hash[:genre]).to eq('Pop')
      expect(hash[:on_spotify]).to be(true)
    end
  end
end