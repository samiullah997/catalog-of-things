require './item'
# class for creating music album
class MusicAlbum < Item
  attr_accessor :name, :publish_date, :on_spotify
  attr_reader :id

  def initialize(name, publish_date, on_spotify)
    super(publish_date)
    @id = Random.rand(1...1000)
    @name = name
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify == true
  end
end

music = MusicAlbum.new('twilight', '2019-07-09', true)
puts music.can_be_archived?
