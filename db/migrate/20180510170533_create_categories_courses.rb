class CreateCategoriesCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_courses do |t|
      t.boolean :status, default:false

      t.timestamps
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true
    end
  end
end
