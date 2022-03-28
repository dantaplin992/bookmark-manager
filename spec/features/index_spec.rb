
feature 'homepage' do
  scenario 'visit the homepage' do
    visit '/'
    expect(page).to have_content 'Welcome'
  end
end
