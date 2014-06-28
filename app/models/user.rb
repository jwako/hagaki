class User < ActiveRecord::Base
	has_many :senders, :dependent => :destroy
	has_many :messages, :through => :senders

end
