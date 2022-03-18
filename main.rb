require './handle_person'
require './handle_rental'
require './handle_book'
require 'pry'

@handle_book = HandleBooks.new
@handle_person = HandlePersons.new
@handle_rental = HandleRentals.new(@handle_book, @handle_person)

def menu
  puts 'Please choose an option by entering a number: '
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def choose_options(user_input)
  case user_input
  when 1
    @handle_book.display_books
  when 2
    @handle_person.display_people
  when 3
    @handle_person.create_person
  when 4
    @handle_book.create_book
    binding.pry
  when 5
    @handle_rental.create_rental
  when 6
    @handle_rental.display_rental
  end
end

def main()
puts 'Welcome to school library App'
is_working = true
while is_working == true
  menu
  user_input = gets.chomp.to_i
  is_working = false if user_input == 7
  choose_options(user_input)
end
end

main