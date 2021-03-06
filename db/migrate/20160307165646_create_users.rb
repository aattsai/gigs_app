class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :full_name, null: false
      t.string :organization
      t.text :bio
      t.float :rating

      t.timestamps null:false
    end
  end
end
