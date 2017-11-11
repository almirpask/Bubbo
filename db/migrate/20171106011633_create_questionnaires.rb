class CreateQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    create_table :questionnaires do |t|
      t.references :teacher, foreign_key: true
      t.references :classroom, foreign_key: true
      t.boolean :active, default: false
      t.timestamps
    end
  end
end
