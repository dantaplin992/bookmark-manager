feature 'update a bookmark' do
  scenario 'only the title is changed' do
    Bookmark.create(url: 'https://pmtonline.co.uk/', title: 'PMT')
    visit '/bookmarks/update'
    fill_in 'old_title', with: 'PMT'
    fill_in 'new_title', with: 'Andertons'
    click_on 'submit'
    expect(page).to have_content 'Andertons'
  end

  scenario 'only the url is changed' do
    Bookmark.create(url: 'https://pmtonline.co.uk/', title: 'PMT')
    visit '/bookmarks/update'
    fill_in 'old_title', with: 'PMT'
    fill_in 'new_url', with: 'www.andertons.co.uk'
    click_on 'submit'
    expect(page).to have_content 'PMT'
  end

  scenario 'both are changed' do
    Bookmark.create(url: 'https://pmtonline.co.uk/', title: 'PMT')
    visit '/bookmarks/update'
    fill_in 'old_title', with: 'PMT'
    fill_in 'new_url', with: 'www.andertons.co.uk'
    fill_in 'new_title', with: 'Andertons'
    click_on 'submit'
    expect(page).to have_content 'Andertons'
  end
end
