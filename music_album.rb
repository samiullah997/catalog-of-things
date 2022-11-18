require './item'
# class for creating music album
class MusicAlbum < Item
  attr_accessor :name, :publish_date, :on_spotify
  attr_reader :id

  def initialize(name, on_spotify, *args)
    super(*args)
    @name = name
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify == true
  end
end

music = MusicAlbum.new('twilight', true, 'Rock', 'niicode', '2019-07-09')
puts music.can_be_archived?
