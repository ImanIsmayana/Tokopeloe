class ProfilController < ApplicationController
  def index
    @products = Product.all
    @stores = Store.all
    @users = User.includes(:products, :stores)
  end
end
