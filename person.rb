require './nameable'
require './rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    @nameable = Nameable.new
    super()
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? && @parent_permission == true
  end

  def correct_name
    @name
  end

  def add_rentals(date, book) 
    Rental.new(date, book, self) 
  end 

  private :of_age?
end
