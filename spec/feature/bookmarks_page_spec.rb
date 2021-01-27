feature "bookmarks page" do
  scenario "shows some bookmarks" do
    add_test_url("http://www.makersacademy.com", "Makers")
    visit "/bookmarks"
    expect(page).to have_content "http://www.makersacademy.com"
  end

end

feature 'Adding bookmarks' do
  scenario 'User can add a bookmark to the list and see it' do
    visit '/bookmarks'
    fill_in('url', with: 'http://www.bbc.co.uk')
    fill_in('title', with: 'bbc')
    click_button('Add URL')
    expect(page).to have_link('bbc')
  end
end
