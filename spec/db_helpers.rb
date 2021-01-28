require 'pg'

def added_data(id:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.query("SELECT * FROM bookmarks WHERE id = '#{id}';")
end

def truncate_test_table
  begin

    connection = PG.connect dbname: 'bookmark_manager_test', user: ENV["USER"]

    connection.exec 'truncate bookmarks'

    rescue PG::Error => e
      puts e.message

    ensure
      connection.close if connection

  end

end

def add_test_url(url, title)

  Bookmark.create(url, title)

end
