feature 'delete bookmarks' do
  it 'deletes specified bookmarks from the list' do
    Bookmark.create(url: 'www.youtube.com/', title: 'Youtube')
    visit '/bookmarks'
    expect(page).to have_link('Youtube', href: 'www.youtube.com/')

    click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Youtube', href: 'www.youtube.com/')
  end
end
