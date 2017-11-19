class AddThemeToQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    add_column :questionnaires, :theme, :string
  end
end
