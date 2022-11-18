require 'date'

#=> implementation of Item class
class Item
  attr_reader :id, :publish_date, :archived, :genre, :author

  def initialize(genre, author, publish_date, id = Random.rand(0..100))
    @genre = genre
    @author = author
    @id = id
    @publish_date = publish_date
    @archived = false
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived == true
  end
end
