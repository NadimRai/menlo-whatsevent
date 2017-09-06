class Admin::ApplicationController < ApplicationController
  before_action :authorize_admin!
  def index
  	@events = Event.all
  	@users = User.all
    @categories = Category.all
    @comments =  Comment.all 
    @attendances = Attendance.all
    @likes = Like.all
  end

  private

  def authorize_admin!
  	authenticate_user!

  	unless current_user.admin?
  		flash[:alert] = "Restricted Section"
  		redirect_to root_path  
  	end
  end
end
