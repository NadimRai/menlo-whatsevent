class Admin::UsersController < Admin::ApplicationController

	def index
		@users = User.order(:organization_name)
	end
end
