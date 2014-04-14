Sequel.migration do
  up do
    create_table(:dog_list) do
      primary_key :id
      String :name
    end
  end

  down do
    drop_table(:dog_list)
  end
end