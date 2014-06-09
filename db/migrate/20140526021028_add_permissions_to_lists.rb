class AddPermissionsToLists < ActiveRecord::Migration
  def change
    add_column :lists, :permissions, :string, default: 'private'
  end
end
