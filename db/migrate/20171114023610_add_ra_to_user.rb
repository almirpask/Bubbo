class AddRaToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ra, :string, limit: 8
  end
end
