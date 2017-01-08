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
      requires :category_id, type: Fixnum, desc: 'Category ID'
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

    desc 'Delete an event'
    params do
      requires :event_id, type: Fixnum, desc: 'Event ID'
    end
    delete ':event_id' do
      db = Util.connect_db
      db[:events].where(:event_id => params[:event_id]).delete
      '200'
    end

    # PUT /api/v1/events/:id
    desc 'Update an event'
    params do
      requires :event_id, type: Fixnum, desc: 'Event ID.'
      optional :user_id, type: Fixnum, desc: 'User ID.'
      optional :category_id, type: Fixnum, desc: 'Event category ID'
      optional :title, type: String, desc: 'Event title'
      optional :summary, type: String, desc: 'Event summary'
      optional :image_path, type: String, desc: 'Event image'
      exactly_one_of :user_id, :category_id, :title, :summary, :image_path
    end
    put ':event_id' do
      db = Util.connect_db
      # TODO: add DB.exists helper?
      result = db[:events].where(:event_id => params[:event_id]).count
      unless !result.zero?
        error! 'That event does not exist!'
      end

      key = params.keys.select {|p| p != :event_id}[0]
      db[:events].where(:event_id => params[:event_id]).update(:"#{key}" => params[:"#{key}"])
    end
  end
end
