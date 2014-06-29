class MessagesController < ApplicationController
	layout "top"
  before_filter :authenticate_user!

  def index
  end

  def show
    @message = Message.find(params[:id])
  end
  
  def new
  	@message = Message.new
    @sender = User.find(params[:owner]) if params[:owner]
    if params[:reply]
      @sender = User.find(params[:reply])
      @reply = true
    end
  end

  def create
  	@message = current_user.own_messages.new(message_params)
    @message.users << User.find(params[:sender]) if params[:sender]
  	if @message.save
      if params[:reply].present?
    		redirect_to confirm_tutorial_path(m: @message.id)
      else
        redirect_to home_path
      end
  	else
  		render :new
  	end
  end

  private

  def message_params
    params.require(:message).permit(:message, :address, :owner_id)
  end
end
