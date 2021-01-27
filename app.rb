require 'sinatra'
require_relative "lib/bookmark"

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post "/bookmarks" do
    @new_url = params[:url]
    erb :add_bookmark
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
