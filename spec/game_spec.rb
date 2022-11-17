require_relative '../game'

describe Game do
  before :each do
    @game = Game.new '2022-1-1', 'test_multiplayer', '2019-1-1', 'new genre', 'new author'
  end

  it 'check if test game is an instance of Game class' do
    expect(@game).to be_instance_of Game
  end
end
