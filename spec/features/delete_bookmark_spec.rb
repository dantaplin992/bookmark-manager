feature 'delete bookmarks' do
  it 'deletes specified bookmarks from the list' do
    Bookmark.create(url: 'https://www.evilresource.com/', title: 'Evil Resource')
    visit '/bookmarks'
    expect(page).to have_link('Evil Resource', href: 'https://www.evilresource.com/')

    first('.bookmark').click_button 'delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Evil Resource', href: 'https://www.evilresource.com/')
  end
end