class Label
    attr_accessor :title, :color
    attr_reader :id, :items

    def initialize(title, color, id)
        @id = Random.rand(1..100)
        @title = title
        @color = color
        @items = []
    end

    def add_item(item)
        @items << item
        item.add_label(self)
    end
end