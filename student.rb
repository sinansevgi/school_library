require_relative 'person'
class Student < Person
  attr_accessor :classroom
  @@instances = []

  def initialize(age, name = 'Unknown', classroom, parent_permission)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self)
    @@instances << self
  end

  def self.all
    @@instances
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
