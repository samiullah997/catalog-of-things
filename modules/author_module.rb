require_relative '../properties/author'

# module holding methods to interact with the author class
module Authors
  @@author = []
  def self.create_author(first_name, last_name)
    new_author = Author.new(first_name, last_name)
    @@author << new_author
    new_author
  end

  def self.display_create_author
    puts 'Input your first name'
    first_name = gets.chomp
    puts 'Input your last name'
    last_name = gets.chomp
    create_author(first_name, last_name)
  end

  def list_authors
    @@author.each do |n, index|
      puts "#{index + 1}) First Name: #{n.first_name}, Last Name: #{n.last_name}, "
    end
  end

  def load_authors
    return unless File.exist?('data/authors.json')

    JSON.parse(File.read('data/authors.json')).each do |n|
      @@author << Author.new(n['first_name'], n['last_name'], n['id'])
    end
  end

  def save_authors
    new_arr = []
    @@author.each do |n|
      new_arr << { id: n.id, first_name: n.first_name, last_name: n.last_name, items: n.items }
    end
    File.write('data/authors.json', JSON.generate(new_arr)) if new_arr.length.positive?
  end
end
