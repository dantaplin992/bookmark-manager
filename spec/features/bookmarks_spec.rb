require 'bookmark'
require 'pg'

feature 'bookmarks page' do
  scenario 'viewing the bookmarks' do
    visit '/bookmarks'
    Bookmark.create(url: 'https://www.evilresource.com/', title: 'Evil Resource')
    Bookmark.create(url: 'https://www.andertons.co.uk/', title: 'Andertons')
    visit '/bookmarks'
    expect(page).to have_content 'Evil Resource'
    expect(page).to have_content 'Andertons'
  end
end
