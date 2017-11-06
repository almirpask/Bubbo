class CreateQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    create_table :questionnaires do |t|
      t.references :teacher, foreign_key: true
      t.string :question

      t.timestamps
    end
  end
end
