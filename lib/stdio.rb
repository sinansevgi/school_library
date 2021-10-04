module StandardIO
  def self.book_prompt
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    [title, author]
  end

  def self.student_prompt
    print 'Has Parent Permission? [Y/N]: '
    permission = gets.chomp

    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    permission = permission.downcase == 'y'

    [permission, age, name]
  end

  def self.rental_prompt(book:, people:)
    puts 'Select a book from the following list by number'
    list_books(book: book)
    book_index = gets.chomp.to_i - 1
    puts 'Select a person from the following list by number(not id)'
    list_people(people)
    person_index = gets.chomp.to_i - 1
    print 'Date: '
    date = gets.chomp

    [book_index, person_index, date]
  end

  def self.list_books(book:)
    book.all.each_with_index do |b, index|
      puts "#{index + 1}) Title: #{b.title}, Author: #{b.author}"
    end
  end

  def self.list_people(people)
    people.each_with_index do |person, index|
      puts "#{index + 1}) #{person.class} Name:#{person.name} ID:#{person.id} Age: #{person.age}"
    end
  end

  def self.list_rental(people)
    print 'ID: '
    id = gets.chomp.to_i
    person = people.filter { |x| x.id == id }

    person[0].books_list.each do |rental|
      puts "Date: #{rental.date}, Title: #{rental.book.title} Author: #{rental.book.author}"
    end
  end
end
