require_relative '../music_album'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('twilight', '2019-07-09', true)
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

  context 'When creating @music_album. an instance of class MusicAlbum' do
    it 'should take parameters and return source object' do
      @music_album.publish_date.should eql '2019-07-09'
    end
  end
end
