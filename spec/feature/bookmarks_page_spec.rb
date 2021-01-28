feature "bookmarks page" do
  scenario "shows some bookmarks" do
    add_test_url("http://www.makersacademy.com", "Makers")
    visit "/bookmarks"
    expect(page).to have_link('Makers')
  end
end

feature 'Adding bookmarks' do
  scenario 'User can add a bookmark to the list and see it' do
    visit_and_add
    expect(page).to have_link('bbc')
  end
end

feature 'deleting bookmarks' do 
  scenario 'User can delete selected bookmarks on the list' do 
    visit_and_add
    expect(page).to have_link('bbc')
    click_button "Delete bbc bookmark"
    expect(page).to have_no_link('bbc')
  end
end