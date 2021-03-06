class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content, null: false
      t.integer :user_id
      t.integer :performer_id
      t.integer :conversation_id, null: false

      t.timestamps null: false
    end
  end
end
