require './person'

class Student < Person
  def initialize(classroom, _name = 'Unknown')
    super('Ritta', 14)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
