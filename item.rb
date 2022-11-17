require 'date'

#=> implementation of Item class
class Item
  attr_reader :id, :publish_date, :archived

  def initialize(publish_date, id = Random.rand(0..100), archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end
end
