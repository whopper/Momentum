require 'grape'

class Categories < Grape::API
  resource :categories do
    # GET /app/v1/categories
    desc 'Get all event categories'
    get do
      db = Util::connect_db
      db[:event_categories].all
    end

    # POST /api/v1/categories
    desc 'Add a new event category'
    params do
      requires :name, type: String, desc: 'Name of the category.'
      requires :description, type: String, desc: 'Description of the category'
    end
    post do
      db = Util::connect_db
      duplicate = db[:event_categories].where(:name => params[:name]).count
      unless duplicate.zero?
        error! 'That event already exists!'
      end

      db[:event_categories].insert(:name        => params[:name],
                                   :description => params[:description],
                                   :image_path  => '')
      200
    end

    # DELETE /app/v1/categories/:id
    desc 'Delete an event category'
    params do
      requires :id, type: Fixnum
    end
    delete ':id' do
      db = Util::connect_db
      db[:event_categories].where(:category_id => params[:id]).delete

      '200' # TODO: why does this need to be a string??
    end
  end
end
