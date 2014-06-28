class AddColumnAddressToMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :address, :string
  end
end
