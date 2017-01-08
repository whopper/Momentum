require 'sequel'
require 'spec_helper'
require_relative '../app/api/util/helpers'

describe API do
include Rack::Test::Methods

  #TODO: this is extremely stupid. Make tests better.
  context 'populating the test db' do
    it 'should run tests with populated test databases' do
      users = [
        {
          :first_name => 'Fred',
          :last_name  => 'Fredley',
          :username   => 'fredguy',
          :email      => 'fredguy@gmail.com'
        },
        {
          :first_name => 'Sue',
          :last_name  => 'Sueley',
          :username   => 'suesue',
          :email      => 'suesue@gmail.com'
        }
      ]

      # events
      events = [
        {
          :user_id => 9,
          :title   => 'Read The Master and Margarita',
          :summary => 'Finished the classic Russian novel written by Mikhail Bulgakov.',
          :category_id => 11
        },
        {
          :user_id => 10,
          :title   => 'Finished Harvest Moon',
          :summary => 'Finished the original Harvest Moon on the Playstation 1.',
          :category_id => 12
        },
        {
          :user_id => 10,
          :title   => 'Played Ultimate Frisbee',
          :summary => 'Spent the afternoon playing Ultimate Frisbee in the extreme cold.',
          :category_id => 11
        }
      ]

      ENV['RACK_ENV'] = 'test'
      db = Util::connect_db

      users.each do |u|
        db[:users].insert(:first_name => u[:first_name],
                          :last_name  => u[:last_name],
                          :username   => u[:username],
                          :email      => u[:email])
      end

      events.each do |e|
        db[:events].insert(:user_id   => e[:user_id],
                           :title     => e[:title],
                           :summary   => e[:summary],
                           :category_id => e[:category_id])
      end
    end
  end
end
