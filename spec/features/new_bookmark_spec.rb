require 'bookmark'
require 'pg'

feature 'add a new bookmark' do
  it 'adds a single new bookmark to and displays it in the list' do
    bookmarks = Bookmark.all
    visit '/bookmarks/new'
    fill_in 'newurl', with: 'https://www.pmtonline.co.uk/'
    fill_in 'title', with: 'PMT'
    click_on 'submit'
    expect(page).to have_content 'PMT'
  end

  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in 'newurl', with: 'not a real bookmark'
    fill_in 'title', with: 'zzz'
    click_button('submit')
  
    expect(page).not_to have_content "zzz"
    expect(page).to have_content "You must submit a valid URL."
  end
end
