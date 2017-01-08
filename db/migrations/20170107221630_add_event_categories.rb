Sequel.migration do
  change do
    create_table(:event_categories) do
      primary_key :category_id
      String :name, :size => 30, :null => false
      String :description, :size => 256, :null => false
      String :image_path
    end
  end
end
