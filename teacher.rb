require "./person.rb"

class Teacher < Person
  def initialize(specialization, name = 'Unknown')
    super("Ritta", 14)
    @specialization = specialization
  end
  def can_use_services?
    true
  end
end

teacher = Teacher.new("Coding")