require './app/Pet.rb'
use Rack::Reloader, 0
use Rack::Static, :urls => ["/public"]
use Rack::Auth::Basic do |username, password|
password == "root"
end
run Pet