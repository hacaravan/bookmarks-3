require 'pg'

class Bookmark

  attr_reader :title, :url

  def self.all
    self.urls_from_db
  end

  def self.create(url)
    database = ENV['RACK ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    begin
      connection = PG.connect dbname: database, user: ENV["USER"]
      results = connection.exec "insert into bookmarks (url) values('#{url}')"
      results.each { |row| out_arr << row['url'] }

    rescue PG::Error => e
      puts e.message

    ensure
      results.clear if results
      connection.close if connection
    end
  end

  def self.urls_from_db
    out_arr = []
    database = ENV['RACK ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    begin
      connection = PG.connect dbname: database, user: ENV["USER"]
      results = connection.exec "Select * from bookmarks"
      results.each { |row| out_arr << row['url'] }

    rescue PG::Error => e
      puts e.message

    ensure
      results.clear if results
      connection.close if connection
    end
    out_arr
  end

  private_class_method :urls_from_db


end
