require 'sinatra'

# get '/' do
# 	 erb :listings, layout: :index	
# end
# WONDER if theres a way to combine this one with another one...


get '/index' do
	@blogposts = [
		{userid: "ChisW", timestamp: "3:45pm April 11", msg: "This is the first test message."},
		{userid: "Butch", timestamp: "3:48pm April 11", msg: "This is another message."},
		{userid: "Bobby", timestamp: "3:50pm April 11", msg: "This is yet another message. And this is some more text. \
			and this is some more text. and test test test. Today is the first day of the rest of your life. Today is \
			the first day of the test of your life.  Today is the first day of the rest of your life."} ]
	erb :listings, layout: :index
end


get '/newpost' do
    erb :newpost, layout: :index
end

get '/showsingle' do
    erb :showsingle, layout: :index
end