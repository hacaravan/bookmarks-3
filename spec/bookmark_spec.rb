require "bookmark"

describe Bookmark do

  it "returns URLs" do
    expect(Bookmark.all('bookmark_manager_test')).to include "http://www.makersacademy.com"
  end

end
