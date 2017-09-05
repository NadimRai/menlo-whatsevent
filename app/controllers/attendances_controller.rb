class AttendancesController < ApplicationController
	before_action :set_event
	before_action :authenticate_user!

	def create
		@attendance = @event.attendances.where(attendee: current_user).first_or_create

		if @attendance.save
			flash[:notice] = "You have successfully registered to this event"
			redirect_to user_registered_path(current_user)
		end
	end

	private

	def set_event
		@event = Event.find(params[:event_id])
	end
end
