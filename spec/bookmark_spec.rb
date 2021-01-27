require "bookmark"

describe Bookmark do
  subject(:bookmark) { described_class.new("bbc", "www.bbc.co.uk")}
  describe '.all' do
    it "returns URLs" do
      add_test_url("http://www.makersacademy.com", "Makers")
      expect(Bookmark.all).to include "http://www.makersacademy.com"
    end
  end

  describe '.create' do
    it 'creates a bookmark entry in the bookmark table' do
      described_class.create('bbc.co.uk', 'bbc')
      expect(described_class.all).to include(url: 'bbc.co.uk', title: 'bbc')
    end
  end

end
