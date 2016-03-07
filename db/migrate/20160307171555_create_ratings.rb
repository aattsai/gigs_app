class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.float :value, null: false
      t.string :comment
      t.integer :user_id, null: false
      t.integer :performer_id
      t.integer :band_id

      t.timestamps null: false
    end
  end
end
