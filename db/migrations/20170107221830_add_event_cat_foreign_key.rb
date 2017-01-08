Sequel.migration do
  change do
    alter_table(:events) {add_foreign_key :category_id, :event_categories, :null => false}
  end
end
