require_relative '../properties/label'

describe Label do
  before :each do
    @label = Label.new('javaScript', 'Red')
    @book1 = Book.new('Samiullah', 'bad', 'new genre', 'new author', '2022/11/16')
    @book2 = Book.new('Nii', 'good', 'new genre', 'new author', '2022/11/15')
  end

  context 'Creating a new label' do
    it 'should have the following attributes' do
      expect(@label.title).to eql('javaScript')
      expect(@label.color).to eql('Red')
      expect(@label.id).to be_instance_of(Integer)
    end
    it 'Be an instance of the class Label' do
      expect(@label).to be_instance_of Label
    end
  end

  context 'Using #add_item method' do
    it 'can use add_item method' do
      expect(@label).to respond_to(:add_item)
    end
    it 'add an item, items array length will be increase' do
      expect(@label.items.count).to eq(0)
      @label.add_item(@book1)
      expect(@label.items.count).to eq(1)
    end
  end
end
