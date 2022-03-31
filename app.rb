require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/bookmark'
require_relative './database_connection_setup.rb'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  configure :development do
    register Sinatra::Reloader
  end
  register Sinatra::Flash

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
    if Bookmark.validate_url(params[:newurl])
      Bookmark.create(url: params[:newurl], title: params[:title])
      redirect '/bookmarks'
    else
      flash[:notice] = "You must submit a valid URL."
      redirect '/bookmarks/new'
    end
    
  end

  delete '/bookmarks/delete' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/update' do
    erb :'bookmarks/update_bm'
  end

  patch '/updated' do
    Bookmark.update(
      old_title: params[:old_title], 
      url: params[:new_url], 
      new_title: params[:new_title]
    )
    redirect '/bookmarks'
  end

  post '/bookmarks/:id/comments/new' do
    @id = params[:id]
    erb :'bookmarks/comments'
  end

  post '/bookmarks/:id/comments/add_comment' do
    connection = PG.connect(dbname: 'bookmark_manager')
    connection.exec_params(
      'INSERT INTO comments (text, bookmark_id) VALUES($1, $2);',
      [params[:comment], params[:id]]
    )
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
