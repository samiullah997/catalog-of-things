require_relative '../genre'

module Genres
  def list_genres
    puts ''
    puts 'List all genres:'
    puts ''
    if @load_genre.empty?
      puts 'No genres recorded yet.'
      return
    end
    @load_genre.each_with_index do |genre, i|
      puts "#{i} : #{genre['name']}"
    end
  end
  def save_genre(data)
    genres = @load_genre
    data.each do |genre|
      genres << {id: genre.id, name: genre.name}
    end
    File.write('data/genre.json', JSON.pretty_generate(genres))
  end
  def add_genres(genre_name)
    genre = Genre.new(genre_name)
    @genres << genre
    save_genre([genre])
  end
  def load_genre
    [] unless File.exist?('data/genre.json')
    JSON.parse(File.read('data/genre.json'))
  end
end
