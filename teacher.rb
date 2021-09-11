require_relative 'person'
class Teacher < Person
  def initialize(specialization, name: 'Unknown')
    super(name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
