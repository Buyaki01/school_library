require './student'
require './teacher'
require './book'

@books = []
@persons = []
@rentals = []

def display_books
  @books.each do |book|
    puts "#{book.title} #{book.author}"
  end
end

def display_people
  @persons.each do |person|
    puts "#{person.id} #{person.name} #{person.class.name} #{person.age}"
  end
end

def display_rental(person_id)
  @rentals.each do |rental|
    puts "#{rental.date}, #{rental.book.title}, #{rental.book.author}" if rental.person.id == person_id
  end
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

def create_student
  print 'Age:'
  age = gets.chomp
  print 'Name:'
  name = gets.chomp
  print 'Has parent permission?[Y/N]'
  parent_permission = gets.chomp
  case parent_permission
  when 'Y'
    parent_permission = true
  when 'N'
    parent_permission = false
  end
  student = Student.new(name, age, parent_permission)
  @persons.push(student)
end

def create_teacher
  print 'Age:'
  age = gets.chomp

  print 'Name:'
  name = gets.chomp

  print 'specialization:'
  specialization = gets.chomp
  
  teacher = Teacher.new(name, age, specialization)
  @persons.push(teacher)
end

def create_person
  puts 'Do you want to create a Student(1) or a Teacher(2)[Input the number]:'
  index_create_person = gets.chomp.to_i
  case index_create_person
  when 1
    create_student
  when 2
    create_teacher
  end
  puts "Person created successfully"
end

def create_rental
  index_of_person = gets.chomp
  person = @persons[index_of_person]

  index_of_book = gets.chomp
  book = @books[index_of_book]

  date = gets.chomp

  rental = Rental.new(person, book, date)
  @rentals.push(rental)
end

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

def main()
  puts 'Welcome to school library App'
  is_working = true
  while is_working == true
    menu
    user_input = gets.chomp.to_i

    case user_input
    when 1
      display_books
    when 2
      display_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      display_rental(person_id)
    when 7
      is_working = false
    end
  end
end

main
