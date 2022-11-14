# frozen_string_literal: true

require_relative '../item'

describe Item do
  before :each do
    @item = Item.new 'new genre', 'new author', 'new source', 'new label', Time.local(2022)
  end

  it 'check if test item is an instance of Item class' do
    expect(@item).to be_instance_of Item
  end

  it 'check if can_be_archived method returns false when publish date is less than 10 years' do
    archive_check = @item.can_be_archived
    expect(archive_check).to equal false
  end

  it 'check if move_to_archive method returns nothing if publish date is less than 10 years' do
    @item.move_to_archive
    expect(@item.archived).to equal false
  end
end

describe Item do
  before :each do
    @item = Item.new 'new genre', 'new author', 'new source', 'new label', Time.local(2009)
  end
  
  it 'check if test item is an instance of Item class' do
    expect(@item).to be_instance_of Item
  end

  it 'check if can_be_archived method returns false when publish date is greater than 10 years' do
    archive_check = @item.can_be_archived
    expect(archive_check).to equal true
  end

  it 'check if move_to_archive method returns nothing if publish date is greater than 10 years' do
    @item.move_to_archive
    expect(@item.archived).to equal true
  end
end
