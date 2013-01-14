class SessionsController < ApplicationController
skip_before_filter :require_seller
  def new
    @seller = Seller.new
    @car = Car.new
  end

  def create
    
    auth_hash = request.env['omniauth.auth']
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])

    session[:seller_id] = @authorization.seller_id
  if @authorization

    render 'sellers/index'
    #render 'sellers/show'
    #render 'sellers/index'
    #render :text => "Welcome back #{@authorization.seller.name}! You have already signed up."
  else
    seller = Seller.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
    seller.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    seller.save
     
    render :text => "Hi #{seller.name}! You've signed up."
  end
  end

  def failure
  end

  def destroy
  session[:seller_id] = nil
  redirect_to sellers_url
  #render :text => "You've logged out!"
  end

end
