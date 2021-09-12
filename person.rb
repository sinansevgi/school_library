require_relative 'corrector'
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, parent_permission: true, name: 'Unknown')
    @corrector = Corrector.new
    @id = Random.new_seed
    @name = name
    @age = age
    @parent_permission = parent_permission
    @books = []
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def validate_name(name)
    @name = @corrector.correct_name(name)
  end

  def book_rents(rental)
    @books.push(rental)
  end

  private

  # rubocop:disable Naming/PredicateName
  def is_of_age?
    @age >= 18
  end
  # rubocop:enable Naming/PredicateName
end

require_relative 'teacher'
