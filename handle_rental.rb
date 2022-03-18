require './rental'
require './handle_book'
require './handle_person'

class HandleRentals
  attr_accessor :rentals, :array_of_books, :array_of_persons 
  def initialize(books_instance, people)
    @rentals = []
    @array_of_books = books_instance
    @array_of_persons = people
  end

  def access_books
    @array_of_books.books
  end

  def access_persons
    @array_of_persons.persons
  end

  def create_rental
    puts 'Select a book from the following list by number'
    display_book_rental
    book_index_selected = gets.chomp.to_i

    book = access_books[book_index_selected]

    puts 'Select a person from the following list by number (not ID)'
    display_person_rental
    index_of_person = gets.chomp.to_i
    person = access_persons[index_of_person]

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, book, person)
    @rentals.push(rental)

    puts 'Rental created successfully'
  end

  def display_rental
    puts 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals: '

    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
    end
  end

  def display_book_rental
    access_books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def display_person_rental
    access_persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}}"
    end
  end
end
