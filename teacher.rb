require_relative 'person'
class Teacher < Person
  @@instances = []
  def initialize(age, name = 'Unknown', specialization)
    super(age, name)
    @specialization = specialization
    @@instances << self
  end

  def self.all
    @@instances
  end
  def can_use_services?
    true
  end
end
