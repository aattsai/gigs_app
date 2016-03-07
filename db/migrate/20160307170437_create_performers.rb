class CreatePerformers < ActiveRecord::Migration
  def change
    create_table :performers do |t|
      t.string :username, null:false, unique: true, index: true
      t.string :password_digest, null: false
      t.string :email, null: false, unique: true
      t.string :full_name
      t.string :affiliates
      t.string :instruments
      t.string :bio
      t.float :ratings
    end
  end
end
