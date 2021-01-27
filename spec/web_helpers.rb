require 'pg'

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

def add_test_url(url)

  begin

    connection = PG.connect dbname: 'bookmark_manager_test', user: ENV["USER"]

    connection.exec "insert into bookmarks (url) values ('#{url}')"

    rescue PG::Error => e
      puts e.message

    ensure
      connection.close if connection

  end

end
