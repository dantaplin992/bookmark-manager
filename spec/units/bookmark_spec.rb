require 'bookmark'

RSpec.describe Bookmark do
  context 'viewing the list of bookmarks' do
    it 'displays the list' do
      Bookmark.create(url: "https://www.evilresource.com/", title: "Evil Resource")
      Bookmark.create(url: "https://www.andertons.co.uk/", title: "Andertons")
      bookmarks = Bookmark.all
      expect(bookmarks[0]).to include("title" => "Evil Resource")
      expect(bookmarks[1]).to include("title" => "Andertons")
    end
  end

  it 'adds a new bookmark' do
    Bookmark.create(url: "https://www.evilresource.com/", title: "Evil Resource")
    Bookmark.create(url: "https://www.andertons.co.uk/", title: "Andertons")
    bookmarks = Bookmark.all
    expect(bookmarks[0]).to include("title" => "Evil Resource")
    expect(bookmarks[1]).to include("title" => "Andertons")
  end

  it 'removes a bookmark' do
    Bookmark.create(url: 'https://pmtonline.co.uk/', title: 'PMT')
    Bookmark.create(url: "https://www.andertons.co.uk/", title: "Andertons")
    Bookmark.delete('PMT')
    expect(Bookmark.all).not_to include({ 'title' => 'PMT', 'url' => 'https://pmtonline.co.uk/' })
    expect(Bookmark.all[1]).to include({ "url" => "https://www.andertons.co.uk/", "title" => "Andertons" })
  end

  it 'updates a bookmark' do
    Bookmark.create(url: 'https://pmtonline.co.uk/', title: 'PMT')
    Bookmark.update(old_title: 'PMT', url: 'https://www.andertons.co.uk/', new_title: 'PMT')
    expect(Bookmark.all[0]).to include("url" => "https://www.andertons.co.uk/")
    expect(Bookmark.all[0]).to include("title" => "PMT" )
  end

  it 'updates only the title if the url fienld is blank' do
    Bookmark.create(url: 'https://pmtonline.co.uk/', title: 'PMT')
    Bookmark.update(old_title: 'PMT', url: '', new_title: 'Andertons')
    expect(Bookmark.all[0]).to include("url" => "https://pmtonline.co.uk/")
    expect(Bookmark.all[0]).to include("title" => "Andertons")
  end

  it 'updates only the url if the title field is blank' do
    Bookmark.create(url: 'https://pmtonline.co.uk/', title: 'PMT')
    Bookmark.update(old_title: 'PMT', url: 'https://www.andertons.co.uk/', new_title: '')
    expect(Bookmark.all[0]).to include("url" => "https://www.andertons.co.uk/")
    expect(Bookmark.all[0]).to include("title" => "PMT")
  end

  it 'validates that a given string is a URL' do
    expect(Bookmark.validate_url("http://google.com")).to be true
    expect(Bookmark.validate_url("aaa")).to be false
  end

end
