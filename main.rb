
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'

def list_people
  Student.all.each do |person|
    puts "[student] Name:#{person.name} ID:#{person.id} Age: #{person.age}"
  end
  Teacher.all.each do |person|
    puts "[teacher] Name:#{person.name} ID:#{person.id} Age: #{person.age}"
  end
end

def list_books
end

def list_rentals
end

def create_person
  default_class = Classroom.new('science')

  print 'Do you want to create a student (1) or a teacher (2)?[input the number]: '
  role = gets.chomp.to_i
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp

  if (role == 1)
    print 'Has parent permission? [y/n]: '
    permission = gets.chomp == 'y' ? true : false
    Student.new(
      age,
      name,
      default_class,
      permission
      )
  else
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(
      age,
      name,
      specialization,
    )
  end
  p list_people
  puts 'Person created succesfully'
end

def create_book

end

def create_rental
end


def main
end

create_person
