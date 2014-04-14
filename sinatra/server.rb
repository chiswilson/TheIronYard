require 'sinatra'
require 'faker'

get '/' do
	erb :main, layout: :mylayout
end

get '/index' do
	erb :main, layout: :mylayout
end

get '/funfacts' do
	@facts = ["AVG Distance from sun: 141,600,000 miles",
	          "Orbital period around sun: 1.88 Earth years",
	          "Mars has two moons: <b>Deimos</b> and <b>Phobos</b>.",
	          "The largest volcano in the Solar System is on Mars. It is called Olympus Mons."]
	erb :funfacts, layout: :mylayout
end

get '/pictures' do
	erb :pictures, layout: :mylayout
end