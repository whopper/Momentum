require 'sinatra'

class Web < Sinatra::Base
  get '/' do
    'momentum web frontend!'
  end
end
