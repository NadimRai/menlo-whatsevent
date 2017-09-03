class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def index
		@events = Event.all.order("created_at ASC")
	end

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
		if @event.update(event_params)
			flash[:success] = "Event update"
			redirect_to @event 
		else
			flash.now[:alert] = "Cannot update"
			render 'edit'
		end
	end

	def destroy
		@event.destroy
		flash[:alert] = "Event #{@event.title} is deleted"
		redirect_to events_path
	end

	private

	def event_params
		params.require(:event).permit(:title, :description, :start_date, :end_date, :venue, :location)
	end

	def set_event
		@event = Event.find(params[:id])
	end

end
