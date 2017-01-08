require 'sinatra'
require 'grape'
require 'sequel'
require 'yaml'

require_relative 'resources/users'
require_relative 'resources/events'
require_relative 'resources/categories'
require_relative 'resources/reviews'
require_relative 'util/helpers'

class API < Grape::API
  version 'v1'
  format :json
  prefix :api

  mount Users
  mount Events
  mount Categories
  mount Reviews
end
