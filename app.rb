require_relative './properties/label'
require_relative './io-files/save_data'
require_relative './io-files/read_data'
require_relative './things/book'
require_relative './properties/author'
require_relative './properties/genre'

#=> app class
class App
  attr_reader :books, :labels, :authors, :genres

  def initialize
    @books = ReadData.read_books
    @labels = ReadData.read_labels
    @authors = ReadData.read_authors
    @genres = ReadData.read_genres
  end

  def quit_app
    SaveData.save_books(@books)
    SaveData.save_labels(@labels)
    SaveData.save_authors(@authors)
    SaveData.save_genres(@genres)
    puts 'Thanks! Bye Bye'
    exit
  end

  def add_book
    # label_data
    label = add_label('Book')

    # Author data
    author = add_author

    # Genre Data
    genre = add_genre('Book\'s')

    # book_data
    print 'Select Cover State of the Book? [good/bad]: '
    cover_state = gets.chomp.downcase
    print 'Publisher Name: '
    publisher = gets.chomp
    print 'Pubishing Date[yyy/mm/dd]: '
    publish_date = gets.chomp

    book = Book.new(publisher, cover_state, publish_date)
    label.add_item(book)
    author.add_item(book)
    genre.add_item(book)

    @books << book
    @labels << label
    @genres << genre
    @authors << author
    puts "\n The book '#{label.title}' by #{author.first_name} #{author.last_name} was created successfully!"
  end

  def add_label(item_type)
    # Label props
    print "Title of the #{item_type}: "
    title = gets.chomp
    print "Color of the #{item_type}: "
    color = gets.chomp
    Label.new(title, color)
  end

  def add_genre(item_type)
    # Genre prop
    print "#{item_type} genre: "
    genre_name = gets.chomp
    Genre.new(genre_name)
  end

  def add_author
    # Author props
    print 'Author\'s first name: '
    first_name = gets.chomp
    print 'Author\'s last name: '
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def list_all_books
    Book.list_all(@books)
  end

  def list_all_labels
    Label.list_all(@labels)
  end

  def list_all_authors
    Author.list_all(@authors)
  end

  def list_all_genres
    Genre.list_all(@genres)
  end

  def list_of_books
    if @books.empty?
      puts 'Empty Book List.'
    else
      puts "Book list, count(#{@books.count}):\n\n"
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Title: '#{book.label.title}', Publisher: #{book.publisher}",
             "Cover State: #{book.cover_state}"
      end
    end
  end

  def list_of_labels
    if @labels.empty?
      puts 'Empty Label List.'
    else
      puts "Labels list, count(#{@labels.count})\n\n"
      @labels.each_with_index do |label, index|
        puts "#{index + 1}) Title: '#{label.title}', Color: #{label.color}"
      end
    end
  end
end
