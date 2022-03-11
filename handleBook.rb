require './book'

class HandleBooks
  def initialize(arg)
    @books = arg
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
    puts @books.each do |book|
      puts book.title
    end
  end
end
