class ProductsController < InheritedResources::Base
  before_action :authenticate_user!

	def index
		@products = Product.recent.order("created_at desc").page(params[:page]).where(["name LIKE?", "%#{params[:search]}%"])
	end

	def show
		@product = Product.find(params[:id])
		@reviews = Review.where(product_id: @product.id).order("created_at DESC")

		if @reviews.blank?
			@avg_review = 0
		else
			@avg_review = @reviews.average(:rating).round(2)
		end
	end



  private

    def product_params
      params.require(:product).permit(:name, :description, :image, :price, :expire, :user_id, :store_id)
    end
end