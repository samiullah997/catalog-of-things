module Genres
  def list_genres
    puts ''
    puts 'List all genres:'
    puts ''
    if @genres.empty?
      puts 'No genres recorded yet.'
      return
    end
    @genres.each do |genre|
      puts "Genre: #{genre.names}"
    end
  end

  def save_genre
    gen = []
    @genres.each do |genre|
      gen << genre.names
    end
    File.open('./json/genres.json', 'w') do |f|
      f.puts gen.to_json
    end
  end

  def add_genres
    init = []
    genre_names = %w[Comedy Thriler]
    genre_names.each do |_genre|
      init << Genre.new(genre_names)
    end
  end

  def load_genre
    genre_file = File.exist?('.json/genres.json') ? File.read('.json/genres.json') : '[]'
    genre_h = JSON.parse(genre_file)
    genre_h.each do |genre|
      @genres << Genre.new(genre)
    end
  end
end
