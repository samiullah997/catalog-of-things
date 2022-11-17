require_relative '../game'

# module holding methods to interact with the game class
module Games
  @games = []

  def create_game(genre, author, source, label, publish_date, multiplayer, last_played_at)
    @games << Game.new(genre, author, source, label, publish_date, multiplayer, last_played_at)
  end

  def list_games
    @games.each do |n|
      puts "#{n.multiplayer}, #{n.publish_date}, #{n.last_played_at}"
    end
  end

  def load_games
    return unless File.exist?('data/games.json')

    JSON.parse(File.read('data/games.json')).each do |n|
      create_author(n[id], n['first_name'], n['last_name'])
    end
  end

  def save_games
    new_arr = []
    @games.each do |n|
      new_arr << { id: n.id, first_name: n.first_name, last_name: n.last_name, items: n.items }
    end
    File.write('data/rentals.json', JSON.generate(new_arr)) if new_arr.length.positive?
  end
end
