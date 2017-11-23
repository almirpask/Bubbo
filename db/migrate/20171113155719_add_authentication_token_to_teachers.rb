class AddAuthenticationTokenToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :authentication_token, :string, limit: 30
    add_index :teachers, :authentication_token, unique: true
  end
end
