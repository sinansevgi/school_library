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
  Book.all.each_with_index do |book, index|
    puts "#{index}) Title:#{book.title}, Author:#{book.author}"
  end
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

  puts 'Person created succesfully'
end

def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  Book.new(title, author)

  puts 'Person created succesfully'
end

def create_rental
end

def list_person_rentals
  # print 'ID: '
  # id = gets.chomp.to_i
  # person = Person.all.filter{|person| person.id == id}
  # p person
end

def main
  puts '1 - List all people'
  puts '2 - List all books'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  case gets.chomp.to_i
  when 1
    list_people
  when 2
    list_books
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    list_person_rentals
  else
    return
  end
  main
end

main
