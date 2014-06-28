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
    @sender = User.find(params[:reply]) if params[:reply]
  end

  def create
  	@message = current_user.own_messages.new(message_params)
    @message.users << User.find(params[:sender]) if params[:sender]
  	if @message.save
  		redirect_to home_path
  	else
  		render :new
  	end
  end

  private

  def message_params
    params.require(:message).permit(:message, :address, :owner_id)
  end
end
