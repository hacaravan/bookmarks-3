def visit_and_add
    visit '/bookmarks'
    fill_in('url', with: 'http://www.bbc.co.uk')
    fill_in('title', with: 'bbc')
    click_button('Add URL')
end