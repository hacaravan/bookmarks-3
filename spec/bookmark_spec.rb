require "bookmark"

describe Bookmark do
  let(:title) { "bbc" }
  let(:url) { "www.bbc.co.uk" }
  subject(:bookmark) { described_class.new(url, title) }

  describe '.all' do
    it "returns bookmark objects" do
      p title.class
      add_test_url(url, title)
      expect(Bookmark.all).to all(be_an_instance_of(Bookmark))
    end
  end

  describe '.create' do
    it 'creates a bookmark entry in the bookmark table' do
      described_class.create(url, title)
      # expect(described_class.all).to include(url: 'bbc.co.uk', title: 'bbc')
      expect(Bookmark.all.first).to have_attributes(url: url, title: title)
    end
  end

end
