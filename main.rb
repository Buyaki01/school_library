require './handle_person'
require './handle_rental'
require './handle_book'

@handle_book = HandleBooks.new
@handle_person = HandlePersons.new
@rental = HandleRentals.new({ rentals: @rentals, persons: @persons, books: @books })

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
  when 5
    @rental.create_rental
  when 6
    @rental.display_rental
  end
end


def main()
puts 'Welcome to school library App'
is_working = true
while is_working == true
  # @menu = Menu.new
  menu
  user_input = gets.chomp.to_i
  is_working = false if user_input == 7
  choose_options(user_input)
end
end

main