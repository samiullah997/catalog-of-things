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

  def can_be_archived
    ((Time.now - @publish_date) / 31_557_600).round(2) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived == true
  end
end
