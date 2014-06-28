class User < ActiveRecord::Base
	has_many :own_messages, class_name: 'Message', foreign_key: "owner_id"
	has_many :senders, :dependent => :destroy
	has_many :messages, :through => :senders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.options_for_select
    User.all.collect do |usr|
      [usr.name, usr.id]
    end
  end
  
end
