require File.expand_path('../config/environment', __FILE__)
#use Rack::Session::Cookie
run Rack::Cascade.new [API, Web]
