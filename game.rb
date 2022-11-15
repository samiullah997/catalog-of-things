require_relative './item'

# Class for creating game object
class Game < Item
  attr_accessor :publish_date

  def initialize(*args, multiplayer, last_played_at)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived
    super && ((Time.now - @publish_date) / 31_557_600).round(2) > 2
  end
end
