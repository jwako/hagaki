class AddColumnReplyToToMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :reply_to, :integer, index: true
  end
end
