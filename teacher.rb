require_relative 'person'
class Teacher < Person
  @teachers = []
  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
    all << self
  end

  def self.all
    @teachers
  end

  def can_use_services?
    true
  end
end
