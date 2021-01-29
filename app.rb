require 'sinatra'
require_relative "lib/bookmark"

class BookmarkManager < Sinatra::Base
  enable :method_override

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

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/edit/:id' do
    @bookmark = Bookmark.find_by_id(params[:id])
    erb :edit_bookmark
  end

  patch '/bookmarks/:id' do
    Bookmark.update(params[:id], params[:URL], params[:Name])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
