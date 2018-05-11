class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :name
      t.boolean :is_delete, default:false

      t.timestamps
      t.references :wordlist, foreign_key: true
    end
  end
end
