require_relative 'person'
class Student < Person
  attr_accessor :classroom

  @instances = []

  def initialize(age, classroom, parent_permission, name = 'Unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
