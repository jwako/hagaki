class GuidesController < ApplicationController
	layout "top"
	before_filter :authenticate_user!

  def show
  end

end
