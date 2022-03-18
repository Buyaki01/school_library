require './book'
require 'json'
class HandleBooks
  attr_accessor :books

  def initialize
    @books = load_books
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    books_storage = File.new('./json/books.json', 'w')
    book_json = @books.map { |b| { title: b.title, author: b.author } }
    books_storage.puts(JSON.pretty_generate(book_json))
    books_storage.close
    puts 'Book created successfully'
  end

  def display_books
    @books.each do |book|
      puts "Title: #{book.title}"
      puts "Author: #{book.author}"
    end
  end

  def load_books
    if File.exist?('./json/books.json')
      store_books = JSON.parse(File.read('./json/books.json'))
      store_books.map do |b|
        Book.new(b['title'], b['author'])
      end
    else
      puts 'No books in the library'
    end
  end
end
