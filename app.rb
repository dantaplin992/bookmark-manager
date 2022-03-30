require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Welcome!"
  end

  get '/bookmarks' do
    # @bookmarks = Bookmark.all
    erb(:bookmarks, locals: { bookmarks: Bookmark.all })
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:newurl], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/delete' do
    p params
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/update' do
    erb :'bookmarks/update_bm'
  end

  post '/updated' do
    Bookmark.update(
      old_title: params[:old_title], 
      new_url: params[:new_url], 
      new_title: params[:new_title]
    )
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
