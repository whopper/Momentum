ENV['RACK_ENV'] ||= test

require File.expand_path('../../app/api/api.rb', __FILE__)
require File.expand_path('../../app/api/web.rb', __FILE__)
