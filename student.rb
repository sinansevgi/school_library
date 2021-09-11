require_relative 'person'
class Student < Person
  def initialize(classroom, name: 'Unknown')
    super(name)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
