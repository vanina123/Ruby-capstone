require_relative '../genre'

RSpec.describe Genre do
  describe '#to_hash' do
    it 'returns a hash representation of the genre' do
      genre = Genre.new('Rock')

      expect(genre.name).to eq('Rock')
    end
  end
end
