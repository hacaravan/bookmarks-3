require "bookmark"

describe Bookmark do

  describe '.all' do
    it "returns URLs" do
      add_test_url "http://www.makersacademy.com"
      expect(Bookmark.all).to include "http://www.makersacademy.com"
    end
  end

  describe '.create' do
    it 'creates a bookmark entry in the bookmark table' do
      described_class.create('bbc.co.uk')
      expect(described_class.all).to include 'bbc.co.uk'
    end
  end

end
