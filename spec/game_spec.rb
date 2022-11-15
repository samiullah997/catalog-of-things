require_relative '../game'

describe Game do
  before :each do
    @game = Game.new 'new genre', 'new author', 'new source', 'new label', Time.local(2022), 'test_multiplayer',
                     Time.local(2019)
  end

  it 'check if test game is an instance of Game class' do
    expect(@game).to be_instance_of Game
  end

  it 'check if can_be_archived returns true when last_played is greater
  than 2 years and the parent_class was archived already' do
    result = @game.can_be_archived
    expect(result).to equal false
  end
end
