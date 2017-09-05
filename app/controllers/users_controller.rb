class UsersController < ApplicationController
	

	def show
		@user = User.find(params[:id])	
	end

	def registered
		@user1 = User.find(params[:user_id])

	end

	
end
