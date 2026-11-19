class CartsController < ApplicationController
  before_action :set_cart

  def show
  end

  def add
    @cart.cart_items.find_or_create_by(drink_id: params[:drink_id]).increment!(:quantity)
  end

  def update
    @cart.cart_items.find_or_create_by(drink_id: params[:drink_id]).update!(quantity: params[:quantity])
    redirect_to action: :show
  end

  def remove
    @cart.cart_items.find_by(drink_id: params[:drink_id])&.destroy
    redirect_to action: :show
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
