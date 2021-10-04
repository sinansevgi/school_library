require_relative 'stdio'

class Book
  attr_accessor :title, :author

  @instances = []

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    self.class.all << self
  end

  def rent_book(rental)
    @rentals.push(rental)
  end

  def self.all
    @instances
  end

  def self.create
    title, author = StandardIO.book_prompt
    puts 'Book created successfully' if new(title, author)
  end

  def can_use_services?
    true
  end
end
