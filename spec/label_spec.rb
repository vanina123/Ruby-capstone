require_relative '../label'
require_relative '../music_album'

RSpec.describe Label do
  describe '#Label' do
    it 'returns a hash representation of the label' do
      label = Label.new('Label 1')
      album = MusicAlbum.new('freedom', 'Album', 'Pop', true)
      label.add_item(album)

      expect(label.title).to eq('Label 1')
      expect(label.items).to be_a(Array)
      expect(label.items[0].artist).to eq('Album')
    end
  end
end
