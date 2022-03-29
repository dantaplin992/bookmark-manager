require 'bookmark'

xfeature 'bookmarks page' do
  scenario 'viewing the bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'https://www.evilresource.com/'
    expect(page).to have_content 'https://www.andertons.co.uk/'
  end
end
