class ApplicationController < ActionController::Base
  before_action :initialize_cart
  before_action :set_render_cart
  before_action :configure_devise_parameters, if: :devise_controller?
  
  
  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :password, :email, :street, :avatar) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :email, :password, :street, :avatar, :password_confirmation)
    end
  end
  
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
