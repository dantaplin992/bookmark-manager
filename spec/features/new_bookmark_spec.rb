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
end
