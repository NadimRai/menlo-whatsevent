class LikesController < ApplicationController
	before_action :authenticate_user!

	def create
		@event = Event.find(params[:event_id])
		@like = @event.likes.where(like: params[:like], user_id: current_user).create

		if @like.valid?
			flash[:notice] = "You #{params[:like]} this event"
		else
			flash[:alert] = "You have already made your choice"
		end
		redirect_to event_path(@event)
	end

	def likes_total
    	self.likes.where(like: "like").count
  	end

	def dislikes_total
	   self.likes.where(like: "dislike").count
	end
end
