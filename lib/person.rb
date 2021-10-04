require_relative 'corrector'
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @corrector = Corrector.new
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @books = []
    self.class.all << self
  end

  def books_list
    @books
  end

  def can_use_services?
    adult? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def book_rents(rental)
    @books.push(rental)
  end

  def self.create_prompt
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    if valid_input?(person_type)
      person_type
    else
      puts 'Invalid Input'
      nil
    end
  end

  def self.valid_input?(person_type)
    [1, 2].include?(person_type.to_i)
  end

  private

  def adult?
    @age >= 18
  end
end
