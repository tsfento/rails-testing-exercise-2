require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'should return the correct books' do
    author = Author.create(name: 'Martha Wells')
    Book.create(title: 'All Systems Red', author_id: author.id)
    Book.create(title: 'Artifical Condition', author_id: author.id)
    Book.create(title: 'Rogue Protocol', author_id: author.id)
    Book.create(title: 'Exit Strategy', author_id: author.id)
    expect(author.books.to_json).to eq(Book.all.to_json)
  end

  it 'should also delete books when deleted' do
    author = Author.create(name: 'Martha Wells')
    Book.create(title: 'All Systems Red', author_id: author.id)
    Book.create(title: 'Artifical Condition', author_id: author.id)
    Book.create(title: 'Rogue Protocol', author_id: author.id)
    Book.create(title: 'Exit Strategy', author_id: author.id)
    author.destroy
    expect(Book.all.to_a).to eq([])
  end
end
