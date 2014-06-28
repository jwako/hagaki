class X::UsersController < ApplicationController
	layout "application"
	before_filter :authenticate_admin!

  def index
  	@q = User.search(params[:q])
	  @users = @q.result(distinct: true)
  end

  def show
  end

end
