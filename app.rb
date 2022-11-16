require_relative './properties/label'
require_relative './io-files/save_data'
require_relative './io-files/read_data'
require_relative './things/book'
require_relative './modules/music_album_module'
require_relative './modules/genre_module'

require_relative './music_album'

#=> app class
class App
  attr_reader :books, :labels, :music_albums

  def initialize
    @books = ReadData.read_books
    @labels = ReadData.read_labels
    @music_album = ReadData.read_music
#     @genres = ReadData.read_genres
  end

  def quit_app
    SaveData.save_books(@books)
    SaveData.save_labels(@labels)
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
    print 'Pubishing Date[yyy/mm/dd]: '
    publish_date = gets.chomp

    book = Book.new(publisher, cover_state, publish_date)
    label = Label.new(title, color)
    label.add_item(book)

    @books << book
    @labels << label
  end

  def add_music_album
    # label_data
    print 'Music Album Title: '
    title = gets.chomp
    print 'Music Album Color: '
    color = gets.chomp

    # music_album_data
    print 'Select Music Album Genre? [rock/pop]: '
    genre = gets.chomp.downcase
    print 'Music Album Artist Name: '
    artist = gets.chomp
    print 'Music Album Release Date[yyy/mm/dd]: '
    release_date = gets.chomp

    music_album = MusicAlbum.new(genre, artist, release_date)
    label = Label.new(title, color)
    label.add_item(music_album)

    @music_album << music_album
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
