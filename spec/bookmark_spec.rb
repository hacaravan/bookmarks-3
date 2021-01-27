require "bookmark"

describe Bookmark do

  it "returns URLs" do
    expect(Bookmark.all).to include "http://www.makersacademy.com"
  end

end
