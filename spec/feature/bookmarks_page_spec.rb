feature "bookmarks page" do
  scenario "shows some bookmarks" do
    add_test_url "http://www.makersacademy.com"
    visit "/bookmarks"
    expect(page).to have_content "http://www.makersacademy.com"
  end

end
