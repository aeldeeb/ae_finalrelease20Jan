SimpleCov.start 'rails'
require 'spec_helper'

describe "associations" do

  it "seller have many cars" do
    car_sellers = Seller.reflect_on_association(:cars)
    car_sellers.macro.should == :has_many
  end

  it "cars belong to seller" do
    owned_cars = Car.reflect_on_association(:seller)
    owned_cars.macro.should == :belongs_to
  end

  it "seller have many authorizations" do
   authorized_sellers = Seller.reflect_on_association(:authorizations)
   authorized_sellers.macro.should == :has_many
  end
end

describe SellersController do

  it "displays only cars according to the search" do
    @car_search = Car.new(:brand => "Opel")
    @car_search = Car.new(:brand => "Skoda")
    
    get :index, :brand => "Opel"

    controller.params[:brand].should == "Opel"

    @toshow_test = Car.where({ :brand => controller.params[:brand]}).all
    @toshow_test.each do |item|
      item.brand.should == "Opel"
    end    
  end


  it 'show seller profile page by ID' do
      
      mock = mock('Seller')
      Seller.should_receive(:find).with('1').and_return(mock)
      get :show, {:id => '1'}
      #@test_show = Seller.new(:name => "Ahmed")
      
      #get :show, :id => '1'
      #controller.params[:id].should == "1"    
  end
  
   it "renders the results template per user search" do
     get :index, :brand => "Opel"
     response.should render_template("results")
   end

   it "renders the compare template when user compares two cars" do
     get :index, :cars_ids => [1, 2]

     response.should render_template("compare")
     controller.params[:cars_ids].should == ["1", "2"]
   end
   
    it 'editing the seller profile' do
      mock = mock('Seller')
      Seller.should_receive(:find).with('1').and_return(mock)
      get :edit, {:id => '1'}
      response.should be_success
    end

    it 'should be possible to update seller' do
      @seller_test = mock_model(Seller)
      Seller.stub!(:find).with("1").and_return(@seller_test)
      @seller_test.stub!(:update_attributes).and_return(true)

      @seller_test.should_receive(:update_attributes).and_return(true)
      put :update, :id => "1", :seller => {}
    end

    it "should redirect to edit if update is failing" do
      @seller_test = mock_model(Seller)
      Seller.stub!(:find).with("1").and_return(@seller_test)
      @seller_test.stub!(:update_attributes).and_return(false)

      put :update, :id => "1", :seller => {}
      response.should render_template("edit")
    end

   it "should render new for creating a new seller" do
     get :new
     response.should render_template("new")
   end

   it "should be able to create a new seller" do
     
     post :create, :seller => {:name => "ahmed", :email => "ahmed@ahmed.com", :phone => "123", :city => "Cairo"}
     response.should redirect_to(seller_url("1"))
   end

   it "should not create a new seller if something is wrong" do
      post :create, :seller => {:email => "ahmed@ahmed.com"}
      response.should render_template("new")
   end

   it "should be able to delete a seller" do
      seller = mock('Seller')
      
      
      Seller.should_receive(:find).with('1').and_return(seller)
      seller.should_receive(:destroy)
      post :destroy, {:id => '1'}
      response.should redirect_to(sellers_url)
   end




end
