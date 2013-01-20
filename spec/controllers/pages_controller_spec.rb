require 'spec_helper'


describe PagesController do

  it "renders About Us page" do
  
  get :about

  response.should render_template("about")
  end

  it "renders Contact Us page" do
    get :contact

    response.should render_template("contact")
  end

  it "renders page containing all used cars offered for sale" do
    get :used

    response.should render_template("used")
  end

end
