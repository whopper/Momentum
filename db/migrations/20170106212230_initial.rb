Sequel.migration do
  change do
    create_table(:users) do
      primary_key :user_id
      String :first_name, :size => 20
      String :last_name, :size => 30
      String :username, :size => 16, :null => false
      String :email, :size => 30, :null => false
    end

    create_table(:events) do
      primary_key :event_id
      foreign_key :user_id, :users
      String :title, :size => 40
      String :summary, :size => 120
      String :image_path
    end

    create_table(:reviews) do
      primary_key :review_id
      foreign_key :user_id, :users
      foreign_key :event_id, :events
      String :review, :text=>true
      Fixnum :score
      DateTime :date
    end
  end
end
