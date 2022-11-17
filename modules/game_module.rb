require_relative '../game'
require_relative './author_module'

module Games
  @@games = []
  def create_game(publish_date, multiplayer, last_played_at, genre, author)
    @@games << Game.new(publish_date, multiplayer, last_played_at, genre, author)
  end

  def display_create_game
    puts 'Input your game genre:'
    genre = gets.chomp
    puts 'Input the game author first name: '
    author_first_name = gets.chomp
    puts 'Input the game author last name: '
    author_last_name = gets.chomp
    new_author = Authors.create_author(author_first_name, author_last_name)
    puts 'Input your game publish date'
    publish_date = gets.chomp
    puts 'Input your game multiplayer'
    multiplayer = gets.chomp
    puts 'Input when last you played your game'
    last_played_at = gets.chomp
    new_game = create_game(publish_date, multiplayer, last_played_at, genre, new_author)
    new_author.add_item(new_game)
  end

  def list_games
    puts 'hey'
    puts @@games
    @@games.each do |n|
      puts "#{index + 1}) Multiplayer: #{n.multiplayer}, Publish Date: #{n.publish_date},
      Last Played: #{n.last_played_at}"
    end
  end

  def load_games
    return unless File.exist?('data/games.json')

    JSON.parse(File.read('data/games.json')).each do |n|
      @@games << Game.new(n['publish_date'], n['multiplayer'], n['last_played_at'], n['genre'], n['author'], n['id'])
    end
  end

  def save_games
    new_arr = []
    @@games.each do |n|
      new_arr << { id: n.id, genre: n.genre, author: n.author, publish_date: n.publish_date,
                   multiplayer: n.multiplayer, last_played_at: n.last_played_at }
    end
    File.write('data/games.json', JSON.generate(new_arr)) if new_arr.length.positive?
  end
end
