require_relative './properties/label'
require_relative './io-files/save_data'
require_relative './io-files/read_data'
require_relative './things/book'
require_relative './modules/music_album_module'
require_relative './modules/genre_module'
require_relative './music_album'
require_relative './modules/author_module'
require_relative './modules/game_module'
#=> app class
class App
  attr_reader :books, :labels
  include MusicAlbums
  include Genres
  include Authors
  include Games
  
  def initialize
    @books = ReadData.read_books
    @labels = ReadData.read_labels
    @load_music_albums = load_album
    @load_genre = load_genre
    @genres = []
    @music_albums = []
    load_authors
    load_games
  end
  def quit_app
    SaveData.save_books(@books)
    SaveData.save_labels(@labels)
    save_authors
    save_games
    puts 'Thanks! Now existing..'
    exit
  end
  def add_book
    # label_data
    print 'Book Title: '
    title = gets.chomp
    print 'Book Color: '
    color = gets.chomp
    # book_data
    print 'Select Cover State of the Book? [good/bad]: '
    cover_state = gets.chomp.downcase
    print 'Publisher Name: '
    publisher = gets.chomp
    print 'Author Name: '
    author = gets.chomp
    print 'Genre'
    genre = gets.chomp
    print 'Pubishing Date[yyy/mm/dd]: '
    publish_date = gets.chomp

    book = Book.new(publisher, cover_state, genre, author, publish_date)
    label = Label.new(title, color)
    label.add_item(book)
    @books << book
    @labels << label
  end
  def list_of_books
    if @books.empty?
      puts 'Book list is Empty. add some books in the list.'
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
      put 'Label List is Empty. add some items'
    else
      puts "Labels list, count(#{@labels.count})\n\n"
      @labels.each_with_index do |label, index|
        puts "#{index + 1}) Title: '#{label.title}', Color: #{label.color}"
      end
    end
  end
end
