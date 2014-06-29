class ReceivesController < ApplicationController
	layout "top"
  before_filter :authenticate_user!

  def index
  	@messages = current_user.messages.mails.order("id DESC")
  end

  def show
  	@message = current_user.messages.find(params[:id])
  end

  def notify
  end
  
end
