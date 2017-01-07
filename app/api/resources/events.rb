require 'grape'

class Events < Grape::API
  resource :events do

    # GET /app/v1/events/:user_id
    desc 'Get all events for a user'
    params do
      requires :user_id, type: Fixnum
    end
    get ':user_id' do
      db = Util::connect_db
      db[:events].where(:user_id => params[:user_id]).all
    end

    # POST /api/v1/events
    desc 'Add a new event'
    params do
      requires :user_id, type: Fixnum, desc: 'User ID.' # I think? The frontend will pass this?
      requires :title, type: String, desc: 'Title of the event.'
      optional :summary, type: String, desc: 'Short summary of the event.'
    end
    post do
      # TODO: how to get the image path?
      db = Util::connect_db
      duplicate = db[:events].where(:user_id => params[:user_id], :title => params[:title]).count
      unless duplicate.zero?
        error! 'That event already exists!'
      end

      db[:events].insert(:user_id    => params[:user_id],
                         :title      => params[:title],
                         :summary    => params[:summary],
                         :image_path => '')
      200
    end
  end
end
