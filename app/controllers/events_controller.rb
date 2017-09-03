class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:success] = "Your event is created"
			redirect_to @event 
		else
			flash.now[:alert] = "Please check error"
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def event_params
		params.require(:event).permit(:title, :description, :start_date, :end_date, :venue, :location)
	end

	def set_event
		@event = Event.find(params[:id])
	end

end
