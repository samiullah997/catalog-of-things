# frozen_string_literal: true

# Class for creating Item
class Item
  attr_reader :archived

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1...1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived
    ((Time.now - @publish_date) / 31_557_600).round(2) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived == true
  end
end
