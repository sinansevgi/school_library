class Book
  attr_accessor :title, :author
  @@instances = []

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @@instances << self
  end

  def rent_book(rental)
    @rentals.push(rental)
  end

  def self.all
    @@instances
  end
end
