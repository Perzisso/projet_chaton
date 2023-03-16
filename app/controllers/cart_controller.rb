class CartController < ApplicationController
  def show
    @render_cart = false
  end

  def add
    @item = Item.find_by(id: params[:id])
    puts "***************"
    puts "current params[:id]"
    puts params[:id]
    puts "******************"
    puts "current params[:quantity]"
    puts params[:quantity]
    quantity = params[:quantity].to_i
    puts "**************"
    puts quantity
    puts "*****************"
    current_order = @cart.orders.find_by(item_id: @item.id)
    puts @item.id
    puts "current_order"
    puts current_order
    puts "*****************"
    
    if current_order && quantity > 0
      current_order.update(quantity:)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orders.create(item: @item, quantity:)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                   partial: 'cart/cart',
                                                   locals: { cart: @cart }),
                              turbo_stream.replace(@product)]
      end
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
