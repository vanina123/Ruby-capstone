require_relative '../book'

RSpec.describe Book do
  describe '#Book' do
    it 'returns a hash representation of the book' do
      book = Book.new('2018-01-01', 'Book', 'Author', 'Good', 'Horror')

      expect(book.publish_date).to eq('2018-01-01')
      expect(book.title).to eq('Book')
      expect(book.author).to eq('Author')
      expect(book.cover_state).to eq('Good')
      expect(book.genre).to eq('Horror')
    end
  end
end
