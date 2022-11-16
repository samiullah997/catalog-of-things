require_relative '../game'

describe Game do
  before :each do
    @game = Game.new Time.local(2022), 'test_multiplayer', Time.local(2019)
  end

  it 'check if test game is an instance of Game class' do
    expect(@game).to be_instance_of Game
  end
end
