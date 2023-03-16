class CartController < ApplicationController
  
  def show
    @render_cart = false
    puts @total = total_for_items
  end

  def add
    if user_signed_in?
      quantity = params[:quantity].to_i
      @item = Item.find_by(id: params[:id])
      Order.create!(item_id: @item.id, cart_id: @cart.id, user_id: current_user.id, quantity: quantity)
      @orders = Order.where(cart_id: @cart.id)

    else
      redirect_to new_user_session_path
    end
  end

  respond_to do |format|
    format.turbo_stream do
      render turbo_stream: [turbo_stream.replace('cart',
                                                 partial: 'cart/cart',
                                                 locals: { cart: @cart }),
                            turbo_stream.replace(@item)]
    end
  end

  def remove
    Order.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'cart/cart',
                                                  locals: { cart: @cart })
      end
    end
  end

  def total_for_items
    @orders = Order.where(cart_id: @cart.id)
    @total = 0
    @orders.each do |order|
      @total = @total + (order.item.price * order.quantity)
    end
    return @total
  end

end
