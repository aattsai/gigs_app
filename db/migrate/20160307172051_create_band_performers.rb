class CreateBandPerformers < ActiveRecord::Migration
  def change
    create_table :band_performers do |t|
      t.integer :performer_id
      t.integer :band_id

      t.timestamps null: false
    end
  end
end
