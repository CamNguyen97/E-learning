class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :name
      t.boolean :choose_status, default: false
      t.boolean :correct_status, default: false

      t.timestamps
      t.references :question, foreign_key: true
    end
  end
end
