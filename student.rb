require "./person.rb"

class Student < Person
  def initialize(classroom, name = 'Unknown')
    super("Ritta", 14)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

student = Student.new("Class 8")