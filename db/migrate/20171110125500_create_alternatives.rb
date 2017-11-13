class CreateAlternatives < ActiveRecord::Migration[5.1]
  def change
    create_table :alternatives do |t|
      t.string :description
      t.boolean :answer
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
