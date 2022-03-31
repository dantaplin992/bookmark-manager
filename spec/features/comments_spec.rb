feature 'the user can add & then view a comment on a bookmark' do
  scenario 'a comment is left on a bookmark' do
    bookmark = Bookmark.create(url: "https://redbubble.com", title: "Redbubble")

    visit '/bookmarks'
    first('.bookmark').click_button 'Add Comment'
    fill_in 'comment', with: 'TEST COMMENT'
    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'
    expect(first('.bookmark')).to have_content('TEST COMMENT')
  end
end