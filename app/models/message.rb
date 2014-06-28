class Message < ActiveRecord::Base
	has_many :senders, :dependent => :destroy
	has_many :users, :through => :senders

	mount_uploader :message, MessageUploader

	scope :notifications, -> { where("text IS NOT NULL") }
	scope :mails, -> { where("message IS NOT NULL")}

end
