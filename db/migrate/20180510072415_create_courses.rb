class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.datetime :dateDay
      t.boolean :is_delete, default:false

      t.timestamps
     
    end
  end
end
