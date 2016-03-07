class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :location, null: false
      t.float :price
      t.integer :user_id
      t.integer :performer_id
      t.integer :band_id

      t.timestamps null: false
    end
  end
end
