class Message < ActiveRecord::Base
	belongs_to :owner, class_name: 'User', foreign_key: "owner_id"
	has_many :senders, :dependent => :destroy
	has_many :users, :through => :senders
	belongs_to :reply_to, class_name: 'User', foreign_key: "reply_to"

	mount_uploader :address, MessageUploader
	mount_uploader :message, MessageUploader

	scope :notifications, -> { where("text IS NOT NULL") }
	scope :mails, -> { where("message IS NOT NULL")}

end
