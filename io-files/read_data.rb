class ReadData
  def self.read_books
    books = []
    return books unless File.exist?('./data/books.json')

    file = File.open('./data/books.json')
    data = JSON.parse(file.read)
    data.each do |item|
      book = Book.new(item['publisher'], item['cover_state'], item['genre'], item['author'], item['publish_date'],
                      item['id'])
      label = Label.new(item['label']['title'], item['label']['color'], id: item['label']['id'])
      book.label = label
      books << book
    end
    file.close
    books
  end

  def self.read_labels
    labels = []
    return labels unless File.exist?('./data/labels.json')

    file = File.open('./data/labels.json')
    data = JSON.parse(file.read)
    data.each do |item|
      label = Label.new(item['title'], item['color'], id: item['id'])
      labels << label
    end
    file.close
    labels
  end
end
