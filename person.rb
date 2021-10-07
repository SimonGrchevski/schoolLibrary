require './corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'unknown', parent_permission= true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = Random.rand(0..5000)
    @corrector = Corrector.new
    @rentals = []
  end

  def of_age?
    age >= 18
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def rentals=(rental)
    @rentals.push(rental)
    rental.person = self
  end
end
