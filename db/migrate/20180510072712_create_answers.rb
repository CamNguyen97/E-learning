class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :name
      t.boolean :choose_status
      t.boolean :correct_status

      t.timestamps
      t.references :question, foreign_key: true
    end
  end
end
