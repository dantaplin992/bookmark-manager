require 'pg'
require_relative './database_connection.rb'

class Bookmark
  def self.all
    result = DatabaseConnection.query('SELECT id,url,title FROM bookmarks;')
    result.map { |bookmark| {"id" => bookmark['id'], "url" => bookmark['url'], "title" => bookmark['title'] } }
  end

  def self.create(url:, title:)
    DatabaseConnection.query(
      "INSERT INTO bookmarks (url, title) VALUES ($1, $2) RETURNING id, title, url;",
    [url,title]
  )
  end

  def self.delete(id)
    id = id.to_i
    DatabaseConnection.query(
      "DELETE FROM bookmarks WHERE id=$1;",
    [id]
    )
  end

  def self.update(old_title:, url:, new_title:)
    DatabaseConnection.query(
      "UPDATE bookmarks SET url = $1 WHERE title = '#{old_title}';",
      [url]
      ) unless url.empty?
      DatabaseConnection.query(
      "UPDATE bookmarks SET title = $1 WHERE title = '#{old_title}';",
      [new_title]
      ) unless new_title.empty?
  end

end
