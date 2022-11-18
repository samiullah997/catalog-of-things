require_relative './item'

# Class for creating game object
class Game < Item
  attr_accessor :publish_date, :id, :multiplayer, :last_played_at, :author

  def initialize(multiplayer, last_played_at, *args)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived
    super && Date.today.year - Date.parse(@publish_date).year > 2
  end
end
