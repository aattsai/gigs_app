class CreatePerformers < ActiveRecord::Migration
  def change
    create_table :performers do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :full_name, null: false
      t.string :affiliates
      t.string :instruments
      t.text :bio
      t.string :location
      t.float :rating

      t.timestamps null:false
    end
  end
end
