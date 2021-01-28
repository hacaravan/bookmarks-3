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

end
