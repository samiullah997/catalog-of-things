require_relative '../things/book'

describe Book do
  before :each do
    @book1 = Book.new('Samiullah', 'bad', '2022/11/16')
    @book2 = Book.new('Nii', 'good', '2022/11/15')
    @book3 = Book.new('Bello', 'good', '2009/12/15')
  end

  context 'Creating a new book' do
    it 'should have the following atrributes' do
      expect(@book1.id).to be_kind_of Integer
      expect(@book1.publisher).to eql('Samiullah')
      expect(@book1.cover_state).to eql('bad')
      expect(@book1.publish_date).to eql('2022/11/16')
    end
    it 'Be an instance of the class Book' do
      expect(@book1).to be_instance_of Book
      expect(@book2).to be_instance_of Book
      expect(@book3).to be_instance_of Book
    end
  end

  context 'Archiving Books' do
    it 'use move_to_archive methods ' do
      expect(@book1).to respond_to(:move_to_archive)
      expect(@book2).to respond_to(:move_to_archive)
      expect(@book3).to respond_to(:move_to_archive)
    end
    it 'Can not use can_be_archived method when it private' do
      expect(@book1).not_to respond_to(:can_be_archived?)
      expect(@book2).not_to respond_to(:can_be_archived?)
      expect(@book3).not_to respond_to(:can_be_archived?)
    end
    it 'It should not be archived for @book1 when publish_data diff <10 and cover_state is = good' do
      archived = @book1.archived
      @book1.move_to_archive
      expect(@book1.archived).to eql archived
    end
  end
end
