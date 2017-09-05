class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :owned_post, only: [:edit, :update, :destroy]

	def search
		@events = Event.all
		@categories = Category.all
  		if params[:search]
    		@events = Event.search(params[:search]).order("created_at DESC")
  		else
    		@events = Event.all.order("created_at DESC")
  		end
	end

	def index
		@events = Event.all.order("created_at DESC")
		@categories = Category.order(:name)

	end

	def new
		@event = Event.new
		@category_array = Category.all.map {|c| [c.name,c.id]}
	end

	def create
		@event = current_user.organized_events.build(event_params)
		@event.category_id = params[:category_id]

		if @event.save
			flash[:success] = "Your event is created"
			redirect_to @event 
		else
			flash.now[:alert] = "Please check error"
			render 'new'
		end
	end

	def show
		@comment = Comment.new
		@comment.event_id = @event.id 
	end

	def edit
		@category_array = Category.all.map {|c| [c.name,c.id]}
	end

	def update
		@event.category_id = params[:category_id]
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
		params.require(:event).permit(:title, :description, :start_date, :end_date, :venue, :location, :image, :category_id)
	end

	def set_event
		@event = Event.find(params[:id])

		rescue ActiveRecord::RecordNotFound
			flash[:warning] = "The page you requested does not exist"
			redirect_to root_path	
	end

	def owned_post
	  unless @event.organizer == current_user || current_user.admin?
	    flash[:alert] = "That Event doesn't belong to you!"
	    redirect_to root_path
	  end
  	end

end
