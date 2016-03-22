class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.integer :performer_id, null: false
      t.text :bio

      t.timestamps null: false
    end
  end
end
