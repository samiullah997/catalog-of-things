# class for creating genre
class Genre
  attr_reader :id, :items
  attr_accessor :names

  def initialize(names, id: Random.rand(1..1000))
    @id = id
    @names = names
    @items = []
  end

  def self.list_all(genre_item)
    if genre_item.empty?
      puts 'Genre list is empty'
    else
      puts "Genres list, count(#{genre_item.count}) :\n\n"
      genre_item.each_with_index do |genre, index|
        puts "#{index + 1}) Name: '#{genre.names}'"
      end
    end
  end

  def add_item(item)
    items << item
    item.genre = self
  end
end
