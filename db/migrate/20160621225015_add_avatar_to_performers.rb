class AddAvatarToPerformers < ActiveRecord::Migration
  def change
    add_column :performers, :avatar, :string
  end
end
