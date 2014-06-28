class AddColumnOwnerIdToMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :owner_id, :integer, index: true
  end
end
