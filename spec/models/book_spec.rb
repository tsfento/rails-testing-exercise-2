require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'should be valid if created with an author' do
    author = Author.create(name: 'Martha Wells')
    book = Book.create(title: 'All Systems Red', author_id: author.id)
    expect(book).to be_valid
  end

  it 'should be invalid if not created with an author' do
    book = Book.create(title: 'All Systems Red', author_id: nil)
    expect(book).not_to be_valid
  end
end
