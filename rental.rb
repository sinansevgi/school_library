class Rental
  attr_accessor :date, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rent_book(self)
    person.book_rents(self)
  end
end
