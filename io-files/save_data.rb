require 'fileutils'
require 'json'

class SaveData
  def self.check_file_exist(filename)
    FileUtils.mkdir_p('./data')
    FileUtils.touch('./data/labels.json') if !File.exist?('./data/labels.json') && filename == 'labels'
    FileUtils.touch('./data/books.json') if !File.exist?('./data/books.json') && filename == 'books'
  end

  def self.save_books(books)
    book_array = []
    books.each do |book|
      book_array << json_format(book)
    end
    return if book_array.empty?

    check_file_exist('books')
    File.write('./data/books.json', JSON.pretty_generate(book_array))
  end

  def self.json_format(book)
    {
      publish_date: book.publish_date,
      cover_state: book.cover_state,
      publisher: book.publisher,
      id: book.id,
      label: {
        title: book.label.title,
        color: book.label.color,
        id: book.label.id
      }
    }
  end

  def self.save_labels(labels)
    labels_array = []
    labels.each do |label|
      labels_array << {
        title: label.title,
        color: label.color,
        id: label.id
      }
    end
    return if labels_array.empty?

    check_file_exist('labels')
    File.write('./data/labels.json', JSON.pretty_generate(labels_array))
  end
end
