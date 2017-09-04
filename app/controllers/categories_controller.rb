class CategoriesController < ApplicationController
	before_action :set_category, only: [:show]
  	
  def show
    @categories = Category.order(:name)
    
  end


  private


    def set_category
      @category = Category.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The category you were looking for could be found."
      redirect_to(request.referrer || events_url)
    end

end
