require_relative '../properties/author'
require_relative '../modules/author_module'
require_relative '../item'

describe Author do
  before :each do
    @author = Author.new 'test_first_name', 'test_last_name'
  end

  it 'check if test author is an instance of Author class' do
    expect(@author).to be_instance_of Author
  end

  it 'check if item is added to author items list' do
    item = Item.new '2022/11/15'
    @author.add_item(item)
    expect(@author.items.length).to be 1
  end
end

describe Authors do
  it 'test for creating author' do
    Authors.create_author('test_first_name', 'test_last_name')
    expect(Authors.author.length).to be 1
  end
end
