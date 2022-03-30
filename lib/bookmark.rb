require 'pg'

class Bookmark
  def self.all 
    connection = connect_to_db
    result = connection.exec('SELECT id,url,title FROM bookmarks;')
    result.map { |bookmark| {"id" => bookmark['id'], "url" => bookmark['url'], "title" => bookmark['title'] } }
  end

  def self.create(url:, title:)
    connection = connect_to_db
    connection.exec_params(
      "INSERT INTO bookmarks (url, title) VALUES ($1, $2) RETURNING id, title, url;",
    [url,title]
  )
  end

  def self.delete(id)
    id = id.to_i
    connection = connect_to_db
    connection.exec_params(
      "DELETE FROM bookmarks WHERE id=$1;",
    [id]
    )
  end

  def self.update(old_title:, url:, new_title:)
    connection = connect_to_db
    entry = connection.exec("SELECT * FROM bookmarks WHERE title = '#{old_title}';")
    connection.exec_params(
      "UPDATE bookmarks SET url = $1 WHERE title = '#{old_title}';",
      [url]
      ) unless url.empty?
    connection.exec_params(
      "UPDATE bookmarks SET title = $1 WHERE title = '#{old_title}';",
      [new_title]
      ) unless new_title.empty?
  end

  def self.connect_to_db
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end
end
