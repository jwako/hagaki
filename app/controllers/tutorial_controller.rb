class TutorialController < ApplicationController
	layout "top"
	
  def show
  end

  def confirm
  	@message = Message.find(params[:m])
  end

  def complete
  end
  
end
