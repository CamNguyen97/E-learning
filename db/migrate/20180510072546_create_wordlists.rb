class CreateWordlists < ActiveRecord::Migration[5.1]
  def change
    create_table :wordlists do |t|
      t.string :name
      t.string :from_translator
      t.boolean :is_delete, default:false

      t.timestamps
      t.references :course, foreign_key: true
    end
  end
end
