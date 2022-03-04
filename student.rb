require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, _name = 'Unknown')
    super('Ritta', 14)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
