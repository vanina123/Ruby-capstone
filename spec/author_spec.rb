require_relative '../author'

RSpec.describe Author do
  describe '#author' do
    it 'returns return the data of Author class' do
      author = Author.new('James', 'Last')

      expect(author.first_name).to eq('James')
      expect(author.last_name).to eq('Last')
    end
  end
end
