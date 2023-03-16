class ApplicationController < ActionController::Base
  before_action :initialize_cart
  before_action :set_render_cart
  
  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])


    if @cart.nil?
      @cart = Cart.create!
      session[:cart_id] = @cart.id
    end

  end

  def set_render_cart
    @render_cart = true
  end



end