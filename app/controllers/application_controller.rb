class ApplicationController < ActionController::Base
before_filter :require_seller

#private

def require_seller
  @seller = Seller.find_by_id(session[:seller_id])
  
  redirect_to sellers_url if @seller.nil?
  flash[:error] = "You must be logged in"
end

#def logged_in?
 # !!current_seller
#end
  protect_from_forgery
helper_method :current_seller

private
def current_seller
 @current_seller ||= Seller.find(session[:seller_id]) if session[:seller_id]
end

end
