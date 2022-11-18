require_relative '../game'
require_relative './author_module'

module Games
  @@games = []
  def create_game(multiplayer, last_played_at, publish_date)
    new_game = Game.new(multiplayer, last_played_at, publish_date)
    @@games << new_game
    new_game
  end

  def list_games
    @@games.each_with_index do |n, index|
      puts "#{index + 1}) Multiplayer: #{n.multiplayer}, Publish Date: #{n.publish_date},
      Last Played: #{n.last_played_at}"
    end
  end

  def load_games
    return unless File.exist?('data/games.json')

    JSON.parse(File.read('data/games.json')).each do |n|
      @@games << Game.new(n['multiplayer'], n['last_played_at'], n['publish_date'], n['id'])
    end
  end

  def save_games
    new_arr = []
    @@games.each do |n|
      new_arr << { id: n.id, genre: n.genre, author: n.author, publish_date: n.publish_date,
                   multiplayer: n.multiplayer, last_played_at: n.last_played_at }
    end
    File.write('data/games.json', JSON.pretty_generate(new_arr)) if new_arr.length.positive?
  end
end
