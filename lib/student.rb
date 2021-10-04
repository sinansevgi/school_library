require_relative 'person'
require_relative 'stdio'
class Student < Person
  attr_accessor :classroom, :instances

  @instances = []

  def initialize(age, parent_permission, name = 'Unknown')
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def self.create
    parent_permission, age, name = StandardIO.student_prompt
    puts 'Student created successfully' if new(age, name, parent_permission)
  end

  def self.all
    @instances
  end
end
