require_relative './item'

# Class for creating game object 
class Game < Item
    attr_accessor :publish_date

    def initialize(publish_date, multiplayer, last_played_at)
        super(publish_date)
        @multiplayer = multiplayer,
        @last_played_at = last_played_at
    end

    def can_be_archived
        @self.can_be_archived
    end
end