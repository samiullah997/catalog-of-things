require 'date'

#=> implementation of Item class
class Item
  attr_reader :id, :publish_date, :archived, :genre, :author

  def initialize(publish_date)
    @publish_date = Date.parse(publish_date)
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    Date.today.year - @publish_date.year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived == true
  end
end
