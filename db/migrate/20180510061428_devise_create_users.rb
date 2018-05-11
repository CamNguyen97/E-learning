# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, default: ""
      t.string :encrypted_password, default: ""
      t.boolean :role, default: false
      t.boolean :sex, default: false
      t.string :phone, default:""
      t.string :address, default: ""
      t.string :name, default: ""
      t.boolean :is_delete, default: false
      t.datetime :dateOfbirth, default: -> { 'CURRENT_TIMESTAMP' } 
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps null: false
    end
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
