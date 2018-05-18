class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :question_id
      t.integer :answer_id
      t.boolean :choose_user, default:false

      t.timestamps
      t.references :user, foreign_key: true
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
