feature 'delete bookmarks' do
  it 'deletes specified bookmarks from the list' do
    visit '/bookmarks/delete'
    Bookmark.create(url: 'https://www.evilresource.com/', title: 'Evil Resource')
    Bookmark.create(url: 'https://www.andertons.co.uk/', title: 'Andertons')
    fill_in 'title_to_delete', with: 'Andertons'
    click_on 'submit'
    expect(page).to have_content('Evil Resource')
    expect(page).not_to have_content('Andertons')
  end
end