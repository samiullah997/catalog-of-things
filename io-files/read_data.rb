class ReadData
  def self.read_books
    books = []
    return books unless File.exist?('./data/books.json')

    file = File.open('./data/books.json')
    data = JSON.parse(file.read)
    data.each do |item|
      book = Book.new(item['publisher'], item['cover_state'], item['publish_date'], item['id'])
      label = Label.new(item['label']['title'], item['label']['color'], id: item['label']['id'])
      author = Author.new(item['author']['first_name'], item['author']['last_name'],
                          id: item['author']['id'])
      genre = Genre.new(item['genre']['name'], id: item['genre']['id'])
      book.label = label
      book.genre = genre
      book.author = author
      books << book
    end
    file.close
    books
  end

  def self.read_labels
    labels_array = []
    return labels_array unless File.exist?('./data/labels.json')

    file = File.open('./data/labels.json')
    data = JSON.parse(file.read)
    data.each do |item|
      label = Label.new(item['title'], item['color'], id: item['id'])
      labels_array << label
    end
    file.close
    labels_array
  end

  def self.read_authors
    authors_array = []
    return authors_array unless File.exist?('./data/authors.json')

    file = File.open('./data/authors.json')
    data = JSON.parse(file.read)
    data.each do |author|
      author = Author.new(author['first_name'], author['last_name'], id: author['id'])
      authors_array << author
    end
    file.close
    authors_array
  end

  def self.read_genres
    genres_array = []
    return genres_array unless File.exist?('./data/genres.json')

    file = File.open('./data/genres.json')
    data = JSON.parse(file.read)
    data.each do |genre|
      genre = Genre.new(genre['name'], id: genre['id'])
      genres_array << genre
    end
    file.close
    genres_array
  end
end
