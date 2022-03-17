require './rental'
require './handle_book'
require './handle_person'

class HandleRentals
  def initialize(params)
    @rentals = params[:rentals]
    @books = params[:books]
    @persons = params[:persons]
  end

  def create_rental
    puts 'Select a book from the following list by number'
    display_book_rental
    book_index_selected = gets.chomp.to_i

    book = @books[book_index_selected]

    puts 'Select a person from the following list by number (not ID)'
    display_person_rental
    index_of_person = gets.chomp.to_i
    person = @persons[index_of_person]

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
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def display_person_rental
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}}"
    end
  end
end
