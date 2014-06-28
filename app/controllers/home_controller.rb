class HomeController < ApplicationController
	layout "top"
	before_filter :authenticate_user!

  def show
  	@notifications = current_user.messages.notifications.order("id DESC")
  	@messages = current_user.messages.mails.order("id DESC")
  end

end
