require_relative './properties/label'
require_relative './io-files/save_data'
require_relative './io-files/read_data'
require_relative './things/book'
require_relative './properties/author'
require_relative './properties/genre'
require_relative './modules/game_module'
require_relative './modules/author_module'
require_relative './modules/music_album_module'

#=> app class
class App
  include MusicAlbums
  include Games
  include Authors

  attr_reader :books, :labels, :authors, :genres

  def initialize
    @books = ReadData.read_books
    @labels = ReadData.read_labels
    load_authors
    @genres = ReadData.read_genres
  end

  def quit_app
    SaveData.save_books(@books)
    SaveData.save_labels(@labels)
    save_authors
    SaveData.save_genres(@genres)
    puts 'Thanks! Bye Bye'
    exit
  end

  def add_book
    # label_data  ### - list the labels and allow choose from the list or the user creates a new label
    label = add_label('Book')

    # Author data ### - list the authors and allow choose from the list or the user creates a new author
    author = display_create_author

    # Genre Data ### - list the genere and allow choose from the list or the user creates a new genre
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
    puts "\n The book '#{label.title}' by #{author.first_name} #{author.last_name} was created successfully!"
  end


  def display_create_game
    puts 'Input your game genre:'
    genre = gets.chomp
    puts 'Input your game publish date'
    publish_date = gets.chomp
    puts 'Input your game multiplayer'
    multiplayer = gets.chomp
    puts 'Input when last you played your game'
    last_played_at = gets.chomp

    author = display_create_author
    # Genre Data ### - list the genere and allow choose from the list or the user creates a new genre
    genre = add_genre('Game\'s')

    # label_data  ### - list the labels and allow choose from the list or the user creates a new label
    label = add_label('Game')

    new_game = create_game(publish_date, multiplayer, last_played_at)
    
    author.add_item(new_game)
    genre.add_item(new_game)
    label.add_item(new_game)

    @books << book
    @labels << label
    @genres << genre

    puts "\n The game '#{label.title}' by #{author.first_name} #{author.last_name} was created successfully!"

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

  def list_all_books
    Book.list_all(@books)
  end

  def list_all_labels
    Label.list_all(@labels)
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
