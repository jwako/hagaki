class X::NotificationsController < ApplicationController
  layout "application"
  before_filter :authenticate_admin!
  
  def index
    @messages = Message.notifications
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.reply_to = User.find(params[:reply_to]) if params[:reply_to]
    @message.users << User.all
    if @message.save
      redirect_to x_notifications_path
    else
      render :new
    end
  end

  def edit
    setup_message
  end

  def update
    setup_message
    if @message.update_attributes(message_params)
      redirect_to x_notifications_path
    else
      render :edit
    end
  end

  private

  def setup_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:message, :text, :reply_to)
  end

end
