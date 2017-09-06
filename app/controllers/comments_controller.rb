class CommentsController < ApplicationController
	before_action :set_event
	before_action :authenticate_user!

	def create
		@comment = @event.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			flash[:notice] = "Comment added to the event"
			redirect_to event_path(@comment.event)
		else
			flash.now[:alert] = "Comment could not be created"
			render 'events/show'
		end
	end

	private

	def set_event
		@event = Event.find(params[:event_id])
	end

	def comment_params
		params.require(:comment).permit(:body)
	end
end
