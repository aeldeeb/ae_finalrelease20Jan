class ApplicationController < ActionController::Base
before_filter :require_seller

private

def require_seller

if Rails.env == "development" && Rails.env == "production"
  @seller = Seller.find_by_id(session[:seller_id])
  
  redirect_to sellers_url if @seller.nil?

end
end

  protect_from_forgery
helper_method :current_seller

private
def current_seller
 @current_seller ||= Seller.find(session[:seller_id]) if session[:seller_id]
end

end
