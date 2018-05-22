class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :question_id
      t.integer :answer_id
      t.boolean :choose_user, default:false

      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
