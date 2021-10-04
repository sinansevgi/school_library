require_relative 'stdio'

class Rental
  attr_accessor :date, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rent_book(self)
    person.book_rents(self)
  end

  def self.create(book:, student:, teacher:)
    people = student.all + teacher.all
    book_index, person_index, date = StandardIO.rental_prompt(book: book, people: people)

    person = people[person_index]
    book = Book.all[book_index]

    puts 'Rental created successfully' if new(date, book, person)
  end
end
