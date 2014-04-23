require 'sinatra'
require 'data_mapper'

DataMapper.setup(
  :default,
  'mysql://root@localhost/blogposts'  
)


class Blogpost
	include DataMapper::Resource

	property :id, Serial
	property :timestamp, String
	property :msg, String
	property :title, String
end

DataMapper.finalize.auto_upgrade!


get '/' do
  redirect to('/index')	
end

get '/index' do
	# @blogposts = [
	# 	{userid: "ChisW", timestamp: "3:45pm April 11", msg: "This is the first test message."},
	# 	{userid: "Butch", timestamp: "3:48pm April 11", msg: "This is another message."},
	# 	{userid: "Bobby", timestamp: "3:50pm April 11", msg: "This is yet another message. And this is some more text. \
	# 		and this is some more text. and test test test. Today is the first day of the rest of your life. Today is \
	# 		the first day of the test of your life.  Today is the first day of the rest of your life."} ]    
    @blogposts = Blogpost.all
	erb :listings, layout: :index
end

# ------------------------------------
get '/newpost' do
    erb :newpost, layout: :index
end

post '/create_blogpost' do
	@blogpost = Blogpost.create params[:blogpost]
	redirect to('/index')
end
# ------------------------------------
get '/edit_blogpost/:id' do
	@blogpost = Blogpost.get params[:id]
	erb :editpost, layout: :index
end


# ------------------------------------
delete '/delete_blogpost/:id' do

	@blogpost = Blogpost.get params[:id]
	puts @blogpost.inspect
	@blogpost.destroy
	redirect to('/index')
end

get '/showsingle' do
    erb :showsingle, layout: :index
end