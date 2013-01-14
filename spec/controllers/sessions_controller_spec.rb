require 'spec_helper'

describe "facebook authentication" do
  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it "sets a session variable to the Omniauth auth hash" do
  
   auth_hash = request.env['omniauth.auth']
   Authorization.find_by_uid('383433138417885').should == true
   
  end
end
