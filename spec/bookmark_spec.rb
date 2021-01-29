require "bookmark"

describe Bookmark do
  let(:title) { "bbc" }
  let(:url) { "https://www.bbc.co.uk" }

  describe '.all' do
    it "returns a list of bookmark objects" do
      bookmark = add_test_url(url, title)
      add_test_url('https://wwww.test_url.com', 'test url')
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 2
      expect(bookmarks).to all(be_an_instance_of(Bookmark))
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.url).to eq bookmark.url
      expect(bookmarks.first.title).to eq bookmark.title
    end
  end

  describe '.create' do
    it 'creates a new bookmark in bookmarks table' do
      bookmark = described_class.create(url, title)
      added_data = added_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark

      expect(bookmark.id).to eq added_data.first['id']

      expect(bookmark.title).to eq title

      expect(bookmark.url).to eq url
    end
  end

  describe '.delete' do
    it 'deletes a bookmark in the bookmarks table' do
      bookmark = described_class.create(url, title)
      Bookmark.delete(bookmark.id)
      bookmarks = described_class.all
      expect(bookmarks).to be_empty
    end
  end

  describe '.update' do
    it 'changes the URL and Name of a bookmark' do
      bookmark = described_class.create(url, title)
      id = bookmark.id
      new_url, new_title = "http://netflix.com", "Netflix"
      Bookmark.update(id, new_url, new_title)
      bookmarks = described_class.all
      new_bookmark = bookmarks.first
      expect(new_bookmark).to be_a(Bookmark)
      expect(new_bookmark.title).to eq new_title
      expect(new_bookmark.url).to eq new_url
      expect(new_bookmark.id).to eq id
    end
  end

end
