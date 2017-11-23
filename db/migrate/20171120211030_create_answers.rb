class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :questionnaire, foreign_key: true
      t.references :alternative, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
