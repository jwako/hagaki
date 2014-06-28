class X::HomeController < ApplicationController
	layout "application"
	before_filter :authenticate_admin!

  def show
  end
  
end
