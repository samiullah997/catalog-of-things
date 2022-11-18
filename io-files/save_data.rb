require 'fileutils'
require 'json'

class SaveData
  def self.check_file(path, items)
    FileUtils.mkdir_p('./data')
    FileUtils.touch(path) unless File.exist?(path)
    File.write(path, JSON.pretty_generate(items))
  end

  def self.save_books(books_list)
    books_array = []
    books_list.each do |book|
      books_array << json_format(book)
    end
    return if books_array.empty?

    check_file('./data/books.json', books_array)
  end

  def self.json_format(books)

    ### lets make this resuble for all the data
    {
      publish_date: books.publish_date,
      cover_state: books.cover_state,
      publisher: books.publisher,
      id: books.id,
      label: {
        title: books.label.title,
        color: books.label.color,
        id: books.label.id
      },
      author: {
        first_name: books.author.first_name,
        last_name: books.author.last_name,
        id: books.author.id
      },
      genre: {
        name: books.genre.names,
        id: books.genre.id
      }
    }
  end

  def self.save_labels(labels_list)
    labels_array = []
    labels_list.each do |label|
      labels_array << {
        title: label.title,
        color: label.color,
        id: label.id
      }
    end
    return if labels_array.empty?

    check_file('./data/labels.json', labels_array)
  end

  def self.save_genres(genres_list)
    genres_array = []
    genres_list.each do |genre|
      genres_array << {
        name: genre.names,
        id: genre.id
      }
    end
    return if genres_array.empty?

    check_file('./data/genres.json', genres_array)
  end
end
