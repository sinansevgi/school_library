require_relative 'person'
class Student < Person
  attr_accessor :classroom

  @students = []

  def initialize(age, classroom, parent_permission, name = 'Unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self)
    all << self
  end

  def self.all
    @students
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
