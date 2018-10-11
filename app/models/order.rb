class Order < ApplicationRecord

	require "stripe"
	Stripe.api_key = "sk_test_TCGazlBsoFzKyCeZLuVWHGPj"

  has_many :line_items, dependent: :destroy
  belongs_to :user
  belongs_to :cart



  enum pay_type: {
	"Check" => 0,
	"Credit card" => 1,
	"Purchase order" => 2
	}


	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end
	def params
		@params
	end
end
