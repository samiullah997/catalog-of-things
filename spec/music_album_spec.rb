require_relative '../music_album'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('twilight', true, 'Rock', 'niicode', '2019-07-09')
  end

  context 'When creating @music_album. an instance of class MusicAlbum' do
    it 'should take parameters and return source object' do
      @music_album.should be_an_instance_of MusicAlbum
    end
  end

  context 'When creating @music_album. an instance of class MusicAlbum' do
    it 'should take parameters and return source object' do
      @music_album.name.should eql 'twilight'
    end
  end
end
