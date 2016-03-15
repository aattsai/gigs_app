class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :venue, null: false
      t.string :address, null: false
      t.string :city
      t.string :state
      t.string :country
      t.integer :zipcode, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.float :price
      t.integer :user_id, null: false
      t.integer :performer_id
      t.integer :band_id

      t.timestamps null: false
    end
  end
end
