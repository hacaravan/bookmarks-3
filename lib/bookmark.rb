require 'pg'

class Bookmark

  attr_reader :title, :url, :id

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    self.urls_from_db
  end

  def self.create(url, title)
    database = ENV['RACK ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    begin
      connection = PG.connect dbname: database, user: ENV["USER"]
      result = connection.exec "insert into bookmarks (url, title) values('#{url}', '#{title}') returning id, title, url;"
      Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
    rescue PG::Error => e
      puts e.message

    ensure
      # results.clear if results
      connection.close if connection
    end
  end

  def self.delete(id)
    database = ENV['RACK ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    begin
      connection = PG.connect dbname: database, user: ENV['USER']
      result = connection.exec "DELETE FROM bookmarks WHERE id = #{id};"
    rescue PG::Error => e
      puts e.message

    ensure
      connection.close if connection
    end
  end

  def self.update(id, new_url, new_title)
    database = ENV['RACK ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    connection = PG.connect dbname: database, user: ENV["USER"]
    result = connection.exec "update bookmarks set url = '#{new_url}', title = '#{new_title}' where id = #{id} returning id, title, url;"
  end

  def self.find_by_id(id)
    database = ENV['RACK ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    connection = PG.connect dbname: database, user: ENV["USER"]
    result = connection.exec "select * from bookmarks where id = #{id};"
    Bookmark.new(result[0]['id'], result[0]['url'], result[0]['title'])
  end

  def self.urls_from_db
    out_arr = []
    database = ENV['RACK ENV'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    begin
      connection = PG.connect dbname: database, user: ENV["USER"]
      results = connection.exec "Select * from bookmarks"
      # results.each { |row| out_arr << row['url'] }
      results.map do |bookmark|
        out_arr << Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title'])
      end


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
