class ApplicationController < ActionController::Base
  before_action :initialize_cart
  before_action :set_render_cart
  
  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])


    if @cart.nil?
      @cart = Cart.create!
      session[:cart_id] = @cart.id
    end

    puts "*****"
    puts "current session[:cart_id]"
    puts session[:cart_id]
    puts "current @cart"
    puts @cart
    puts "*****"

  end

  def set_render_cart
    @render_cart = true
  end



end