require 'spec_helper'


describe CarsController do

  it "displays all cars associated to a given seller" do
 
  get :index, :seller_id => "1"
  response.should render_template("index")
  end

  it "able to edit a car associated to a given seller" do
  @car_test = mock_model(Car)
  Car.stub!(:find).with("1").and_return(@car_test)

  @seller_test = mock_model(Seller, :id => "1")
  Seller.should_receive(:find).with('1').and_return(@seller_test)
  @seller_test.should_receive(:cars).and_return(@car_test)
  @car_test.should_receive(:find).with("1").and_return(@car_test)

  get :edit, :seller_id => @seller_test.id, :id => "1"

  response.should be_success
 
 end

  it "should be possible to update a car" do
   @car_test = mock_model(Car)
  Car.stub!(:find).with("1").and_return(@car_test)
  @car_test.stub!(:update_attributes).and_return(true)
  @car_test.should_receive(:update_attributes).and_return(true)
  
  @seller_test = mock_model(Seller, :id => "1")
  Seller.should_receive(:find).with('1').and_return(@seller_test)
  @seller_test.should_receive(:cars).and_return(@car_test)
  @car_test.should_receive(:find).with("1").and_return(@car_test)

  put :update, :seller_id => "1", :id => "1"
   response.should redirect_to(seller_url("1"))
  end

   it "should redirect to edit if update is failing" do
        @car_test = mock_model(Car)
  Car.stub!(:find).with("1").and_return(@car_test)
  @car_test.stub!(:update_attributes).and_return(true)
  @car_test.should_receive(:update_attributes).and_return(false)
  
  @seller_test = mock_model(Seller, :id => "1")
  Seller.should_receive(:find).with('1').and_return(@seller_test)
  @seller_test.should_receive(:cars).and_return(@car_test)
  @car_test.should_receive(:find).with("1").and_return(@car_test)

      put :update, :seller_id => "1", :id => "1"
      response.should render_template("edit")
    end


   it "should be able to action adding a new car" do
  @car_test = mock_model(Car) 
  @seller_test = mock_model(Seller, :id => "1")
  Seller.stub!(:find).with("1").and_return(@seller_test)
  Seller.should_receive(:find).with("1").and_return(@seller_test)
@seller_test.should_receive(:cars).and_return(@car_test)
@car_test.should_receive(:build).and_return(@car_test)

     get :new, :seller_id => "1"
     response.should be_success
   end

   it "should be able to create a new car" do
  

  @car_test = mock_model(Car, :seller_id => "1") 
  @seller_test = mock_model(Seller)
  Seller.stub!(:find).with("1").and_return(@seller_test)
  Seller.should_receive(:find).with("1").and_return(@seller_test)
  @seller_test.should_receive(:cars).and_return(@car_test)
  @car_test.should_receive(:build).and_return(@car_test)
  @car_test.should_receive(:save).and_return(@car_test)
  @car_test.should_receive(:save).and_return(true)

     post :create, :seller_id => "1", :car => {:brand => "Opel", :year => "12/12/2012", :mileage => "10", :model => "Vectra", :color => "Black", :cc => "140", :notes => "20"}

    response.should redirect_to(seller_url("1"))
   end

it "should not create a new car if something is wrong" do
   @car_test = mock_model(Car, :seller_id => "1") 
  @seller_test = mock_model(Seller)
  Seller.stub!(:find).with("1").and_return(@seller_test)
  Seller.should_receive(:find).with("1").and_return(@seller_test)
  @seller_test.should_receive(:cars).and_return(@car_test)
  @car_test.should_receive(:build).and_return(@car_test)
  @car_test.should_receive(:save).and_return(@car_test)
  @car_test.should_receive(:save).and_return(false)

     post :create, :seller_id => "1", :car => {:brand => "Opel", :year => "12/12/2012", :mileage => "10", :model => "Vectra", :color => "Black", :cc => "140", :notes => "20"}

    response.should render_template("new")
   end


  it "show cars per seller" do
    @seller_test = mock_model(Seller)
    @car_test = mock_model(Car)
    Seller.stub!(:find).with("1").and_return(@seller_test)
    Car.stub!(:find).with("1").and_return(@car_test)

    get :show, :seller_id => "1", :id => "1"
  
  end

 it "should be able to delete a car" do
      @car_test = mock_model(Car)
 @seller_test = mock_model(Seller)
  @car_test.should_receive(:find).with('1').and_return(@car_test)
      
      @seller_test.should_receive(:cars).and_return(@car_test)
      Seller.should_receive(:find).with('1').and_return(@seller_test)
      @car_test.should_receive(:destroy)
      post :destroy, :seller_id => "1", :id => '1'
      #response.should redirect_to(sellers_url)
   end

end
