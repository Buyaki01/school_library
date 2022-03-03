class Person
  def initialize(name = 'Unknown', age, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? && @parent_permission == true
  end
  private :of_age?
end

person = Person.new("Ritta", 18)
person_1 = Person.new("Ritta", 15)