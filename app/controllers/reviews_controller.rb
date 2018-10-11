class ReviewsController < InheritedResources::Base
	before_action :set_review, only: [:show, :edit, :update, :destroy]
	before_action :set_product
	before_action :authenticate_user!

	def index
		@reviews = Review.all
	end

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.product_id = @product.id

		if @review.save
			redirect_to @product
		else
			render 'new'
		end

	end

  private

  	def set_review
  		@product = Product.find(params[:id])
  	end

  	def set_product
  		@product = Product.find(params[:product_id])
  	end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end

