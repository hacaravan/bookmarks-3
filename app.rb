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
    Bookmark.create(params[:url], params[:title])
    redirect '/bookmarks'
  end

  post '/bookmarks/delete' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
