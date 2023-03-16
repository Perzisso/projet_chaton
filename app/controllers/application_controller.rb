class ApplicationController < ActionController::Base
  before_action :initialize_cart
  
  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])


    if @cart.nil?
      @cart = Cart.create!
      session[:cart_id] = @cart.id
    end

    puts "*****"
    puts session[:cart_id]
    puts "*****"

  end
end