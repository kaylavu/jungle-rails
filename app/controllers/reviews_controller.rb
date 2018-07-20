class ReviewsController < ApplicationController
    before_filter :authorize

    def create
        @review = Review.new(review_params)
        @review.user = current_user
        @review.product_id = params['product_id']

        if @review.save 
            redirect_to :back, notice: 'Review created!'
        else 
            puts "CREATING A REVIEW NOT WORKING"
            puts @review.errors.messages
        end 
            
    end 

    def destroy
        @review = Review.find params[:id]
        @review.destroy
        redirect_to :back
      end
    
    private

    def review_params
      params.require(:review).permit(
        :rating,
        :description
      )
    end

end
