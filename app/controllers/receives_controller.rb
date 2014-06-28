class ReceivesController < ApplicationController
	layout "top"
  before_filter :authenticate_user!

  def index
  	@messages = current_user.messages.mails.order("id DESC")
  end

end
