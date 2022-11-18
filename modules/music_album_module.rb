require 'json'
require_relative './genre_module'

module MusicAlbums
  include Genres
  def list_music_albums
    puts 'Music albums list is empty! Add a music album.' if @music_albums.empty?
    @load_music_albums.each_with_index do |music_album, index|
      s = "Last played at: #{music_album['name']} - published: #{music_album['publish_date']}"
      p ["#{index})  On Spotify: #{music_album['on_spotify']} - " + s]
    end
  end

  def add_music_album
    print 'Name of the Album: '
    album_name = gets.chomp
    print 'Published date: '
    published = gets.chomp
    print 'On Spotify? (y/n): '
    album_spotify = gets.chomp.upcase
    case album_spotify
    when 'Y'
      album_spotify = true
    when 'N'
      album_spotify = false
    else
      puts 'Invalid option. Please try again.'
    end
    print 'Author Name: '
    author_name = gets.chomp
    print 'Genre: '
    genre_name = gets.chomp
    album = MusicAlbum.new(album_name, album_spotify, genre_name, author_name, published)
    add_genres(genre_name)
    save_album([album])
    puts "Music album #{album_name} created successfully."
  end
  # disable Metrics/MethodLength

  def save_album(data)
    album = @load_music_albums
    data.each do |music_album|
      album << {
        name: music_album.name,
        publish_date: music_album.publish_date,
        on_spotify: music_album.on_spotify,
      }
    end
    File.write('data/music_albums.json', JSON.pretty_generate(album))
  end
  # enable Metrics/MethodLength

  def load_album
    [] unless File.exist?('data/music_albums.json')
    JSON.parse(File.read('data/music_albums.json'))
  end
end
