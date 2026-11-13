class CartsController < ApplicationController
  before_action :set_cart

  def show
  end

  def destroy
    @cart.cart_items.destroy_all
    redirect_to action: :show
  end

  private
    def set_cart
      @cart = Current.session.user.cart
    end
end
