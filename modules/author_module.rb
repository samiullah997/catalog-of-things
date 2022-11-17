require_relative '../author'

# module holding methods to interact with the author class
module Authors
  class << self; attr_accessor :author; end

  self.author = []

  def self.create_author(first_name, last_name)
    @author << Author.new(first_name, last_name)
  end

  def self.display_create_author
    puts 'Input your first name'
    first_name = gets.chomp
    puts 'Input your last name'
    last_name = gets.chomp
    create_author(first_name, last_name)
  end

  def self.list_authors
    @author.each do |n|
      print "#{n.first_name} #{n.last_name}, "
    end
  end

  def self.load_authors
    return unless File.exist?('data/authors.json')

    JSON.parse(File.read('data/authors.json')).each do |n|
      create_author(n[id], n['first_name'], n['last_name'])
    end
  end

  def self.save_authors
    new_arr = []
    @author.each do |n|
      new_arr << { id: n.id, first_name: n.first_name, last_name: n.last_name, items: n.items }
    end
    File.write('data/authors.json', JSON.generate(new_arr)) if new_arr.length.positive?
  end
end
