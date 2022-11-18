require 'date'
require_relative '../music_album'
require_relative '../genre'
require 'yaml'

# write tests for genre class
describe Genre do
  before(:each) do
    @genre = Genre.new(%w[Rock Pop])
  end

  describe '#new' do
    it 'returns a new genre object' do
      expect(@genre).to be_an_instance_of Genre
    end
    it 'throws an ArgumentError when given fewer than 1 parameter' do
      expect { Genre.new }.to raise_exception ArgumentError
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(@genre.name).to eql %w[Rock Pop]
    end
  end
end
