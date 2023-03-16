class CartController < ApplicationController
  def show
    @render_cart = false
  end

  def add
    if user_signed_in?
      quantity = params[:quantity].to_i
      puts "*********"
      puts quantity
      puts "*********"
      @item = Item.find_by(id: params[:id])
      puts @item
      puts "***********"
      puts Order.create!(item_id: @item.id, cart_id: @cart.id, user_id: current_user.id, quantity: quantity)
      @orders = Order.where(cart_id: @cart.id)
      puts "*********"
      puts @orders
      puts "*********"
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
  end
