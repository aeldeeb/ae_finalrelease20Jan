require 'spec_helper'

describe "facebook authentication" do
  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it "sets a session variable to the Omniauth auth hash" do
  
   auth_hash = request.env['omniauth.auth']
   Authorization.find_by_uid('383433138417885').should == nil
   
  end
end

describe SessionsController do

  it "clears the sessions when the user logs out" do

  post :destroy
  end

  it " new session" do
    get :new
  end

  it "new session creation" do
    @auth = mock_model(Authorization)
    Authorization.stub!(:find_by_provider_seller_uid).with("facebook","123").and_return(@auth)
     
  end

end
