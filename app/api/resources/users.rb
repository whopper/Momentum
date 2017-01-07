require 'grape'

class Users < Grape::API
  resource :users do
    # GET /api/v1/users TODO: private
    desc 'Get all users'
    get do
      db = Util::connect_db
      db[:users].all
    end

    # GET /api/v1/users/:id
    desc 'Get user by ID'
    params do
      requires :id, type: Integer, desc: 'User ID.'
    end
    route_param :id do
      get do
        db = Util::connect_db
        result = db[:users].where(:user_id => params[:id])
        result.count > 0 ? result.all : "No user with ID #{params[:id]}"
      end
    end

    # POST /api/v1/users
    desc 'Create new user'
    params do
      requires :first_name, type: String
      requires :last_name, type: String
      requires :username, type: String
      requires :email, type: String
    end
    post do
      db = Util::connect_db

      duplicate = db[:users].where(email: params[:email]).count
      unless duplicate.zero?
        error! 'That user already exists!', 400
      end

      db[:users].insert(:first_name => params[:first_name],
                        :last_name  => params[:last_name],
                        :username   => params[:username],
                        :email      => params[:email])

      200
    end

    # DELETE /app/v1/users/:id
    desc 'Delete a user'
    params do
      requires :id, type: Fixnum
    end
    delete ':id' do
      db = Util::connect_db
      db[:users].where(:user_id => params[:id]).delete

      '200' # TODO: why does this need to be a string??
    end
  end
end
