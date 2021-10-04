require_relative 'person'
class Teacher < Person
  @instances = []
  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def self.all
    @instances
  end

  def self.create
    age, name, specialization = create_prompt
    puts 'Teacher created successfully' if new(age, specialization, name)
  end

  def can_use_services?
    true
  end
end
