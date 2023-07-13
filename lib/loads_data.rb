# require 'json'

# def save_books_to_json(books, filename)
#   book_hashes = books.map(&:to_hash)

#   File.write(filename, JSON.pretty_generate(book_hashes))
# end

# def load_books_from_json(filename)
#   json_data = File.read(filename)

#   book_hashes = JSON.parse(json_data)

#   book_hashes.map { |hash| Book.new_from_hash(hash) }
# end
# book1 = Book.new('2023-01-01', 'Title 1', 'Author 1', 'Good', 'Fiction')
# book2 = Book.new('2023-02-01', 'Title 2', 'Author 2', 'Fair', 'Mystery')
# book3 = Book.new('2023-03-01', 'Title 3', 'Author 3', 'Poor', 'Fantasy')

# save_books_to_json([book1, book2, book3], 'books.json')

# loaded_books = load_books_from_json('books.json')

# loaded_books.each do |book|
#   puts "Title: #{book.title}, Author: #{book.author}"
# end
