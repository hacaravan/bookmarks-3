require "bookmark"

describe Bookmark do

  it "returns URLs" do
    add_test_url "http://www.makersacademy.com"
    expect(Bookmark.all).to include "http://www.makersacademy.com"
  end

end
