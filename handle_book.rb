require './book'

class HandleBooks
  attr_accessor :books

  def initialize
    @books = []
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def display_books
    @books.each do |book|
      puts "Title: #{book.title}"
      puts "Author: #{book.author}"
    end
  end
end
