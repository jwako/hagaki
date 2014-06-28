class X::MessagesController < ApplicationController
	layout "application"
	before_filter :authenticate_admin!

  def index
  	@messages = Message.mails.order(:id)
  end

  def edit
  	setup_message
  	@q = User.search(params[:q])
	  @users = @q.result(distinct: true)
  end

  def update
    setup_message
  end

  def connect
    setup_message
    users = User.find(params[:user_ids])
    @message.users << users
    redirect_to x_messages_path
  end

  private

  def setup_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:message)
  end

end
