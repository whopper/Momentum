require 'grape'

class Reviews < Grape::API
  resource :reviews do

    # POST /api/v1/reviews
    desc 'Add a new review'
    params do
      requires :event_id, type: Fixnum, desc: 'User ID.' # I think? The frontend will pass this?
      requires :review, type: String, desc: 'Review of an event.'
      optional :score, type: Fixnum, desc: 'Numeric review score of an event.'
      # DateTime can be determined here
    end
    post do
      #DB = Util::connect_db
      #DB[:subjects].insert(:name => params[:name])
    end
  end
end
