require_relative 'constants'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'stdio'
require_relative 'rental'

class App
  include Constants
  def initialize
    @cases = {
      '1': -> { StandardIO.list_books(book: Book) },
      '2': -> { StandardIO.list_people(Student.all + Teacher.all) },
      '3': -> { create_person },
      '4': -> { create_book },
      '5': -> { create_rental },
      '6': -> { StandardIO.list_rental(Student.all + Teacher.all) },
      '7': -> { puts 'Thank you for using the app' }
    }

    @input_error = 'Please input a number between 1-7'
  end

  def run
    input = nil
    until input == '7'
      PROMPTS.each { |prompt| puts prompt }
      input = gets.chomp
      if valid_input?(input)
        call_service(input)
      else
        puts @input_error
      end
    end
  end

  def call_service(input)
    @cases[input.to_sym].call
  end

  def create_person
    person_type = Person.create_prompt
    case person_type
    when '1'
      Student.create
    when '2'
      Teacher.create
    end
  end

  def create_book
    Book.create
  end

  def create_rental
    Rental.create(book: Book, student: Student, teacher: Teacher)
  end

  def valid_input?(input)
    (1..7).to_a.include?(input.to_i)
  end
end
