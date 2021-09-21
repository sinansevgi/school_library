require_relative 'person'
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

def create_person
  default_class = Classroom.new('science')

  print 'Do you want to create a student (1) or a teacher (2)?[input the number]: '
  role = gets.chomp.to_i
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp

  if role == 1
    print 'Has parent permission? [y/n]: '
    permission = gets.chomp == 'y'
    Student.new(age, default_class, permission, name)
  else
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(age, specialization, name)
  end

  puts 'Person created succesfully'
end

def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  Book.new(title, author)

  puts 'Book created succesfully'
end

def create_rental
  puts 'Select a book from the following list by number'
  books = Book.all
  list_books
  book = books[gets.chomp.to_i]
  puts 'Select a person from the following list by number (not id)'
  people = Student.all + Teacher.all
  people.each_with_index do |person, index|
    puts "#{index}) name:#{person.name} id:#{person.id}"
  end
  person = people[gets.chomp.to_i]
  print 'Date: '
  date = gets.chomp
  Rental.new(date, book, person)
  puts 'Rental created successfully'
end

def list_person_rentals
  print 'ID: '
  id = gets.chomp.to_i
  person = (Student.all + Teacher.all).filter { |x| x.id == id }

  person[0].books_list.each do |rental|
    puts "Date: #{rental.date}, Title: #{rental.book.title} Author: #{rental.book.author}"
  end
end

def main
  puts "1 - List all people\n2 - List all books"
  puts "3 - Create a person\n4 - Create a book\n5 - Create a rental"
  puts "6 - List all rentals for a given person id\n7 - Exit"
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
