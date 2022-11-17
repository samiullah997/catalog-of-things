# class for creating genre
class Genre
  attr_reader :id
  attr_accessor :name, :items
  def initialize(name)
    @id = rand(1..1000)
    @name = name
    @items = []
  end
  def add_items(item)
    items << item
    item.genre = self
  end
end
