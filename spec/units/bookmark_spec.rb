require 'bookmark'

RSpec.describe Bookmark do
  context 'viewing the list of bookmarks' do
    it 'displays the list' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include "https://www.evilresource.com/"
      expect(bookmarks).to include "https://www.andertons.co.uk/"
    end
  end
end
