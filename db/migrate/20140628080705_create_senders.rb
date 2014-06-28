class CreateSenders < ActiveRecord::Migration
  def change
    create_table :senders do |t|
    	t.references :message, index: true
    	t.references :user, index: true
      t.timestamps
    end
  end
end
