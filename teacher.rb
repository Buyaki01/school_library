require './person'

class Teacher < Person
  def initialize(specialization, _name = 'Unknown')
    super('Ritta', 14)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
