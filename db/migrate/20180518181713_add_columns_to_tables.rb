class AddColumnsToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :phone_number, :string
    add_column :doctors, :phone_number, :string
    add_column :doctors, :specialization, :string
  end
end
