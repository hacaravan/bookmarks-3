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
    click_button "Delete bbc bookmark"
    expect(page).to have_no_link('bbc')
  end
end

feature 'Updating bookmarks' do
  scenario 'User can change URL & name for bookmark' do
    visit_and_add
    click_button "Edit bbc bookmark"
    fill_in('URL', with: 'http://www.twitter.com')
    fill_in('Name', with: 'Twitter')
    click_button('Update Link')
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
    expect(page).to have_no_link('bbc')
  end
end
