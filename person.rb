class Person
  attr_accessor :name, :age
  attr_reader :id
  def initialize(name = "Unknown", parent_permission = true, age)
    @id = Random.new_seed
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  def can_use_services?
    is_of_age? || @parent_permission
  end

  private
  def is_of_age?
    @age >= 18
  end
end

require_relative 'teacher.rb'

