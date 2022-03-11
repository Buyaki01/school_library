require './person'
require './student'
require './teacher'

class HandlePersons
  def initialize(arg)
    @persons = arg
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
    puts 'Person created successfully'
  end

  def display_people
    @persons.map do |person|
      puts "#{person.id} #{person.name} #{person.class.name} #{person.age}"
    end
  end
end