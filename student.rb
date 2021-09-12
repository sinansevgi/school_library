require_relative 'person'
class Student < Person
  attr_accessor :classroom

  def initialize(classroom, name: 'Unknown')
    super(name)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
