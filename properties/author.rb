# class for creating authors
class Author
  attr_accessor :first_name, :last_name
  attr_reader :items, :id

  def initialize(first_name, last_name, id: Random.rand(1...1000))
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def self.list_all(authors)
    if authors.empty?
      puts 'Author List is Empty'
    else
      puts "Authors list, count(#{authors.count}):\n\n"
      authors.each_with_index do |author, index|
        puts "#{index + 1}) Author: #{author.first_name}, #{author.last_name}"
      end
    end
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
