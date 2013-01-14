class CarsController < ApplicationController
skip_before_filter :require_seller, :only => [:show, :destroy]
  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
    #@cars = Car.where({:seller_id => session[:seller_id]}).all
    #@seller = Seller.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cars }
    end
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @car = Car.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @car }
    end
  end

  # GET /cars/new
  # GET /cars/new.json
  def new
    #@car = Car.new
    @seller = Seller.find(session[:seller_id])
    @car = @seller.cars.build
  
    #@car = Car.create(:seller_id => @seller.id)
    #@car = @seller.cars.create()
    #@seller.cars.create :seller_id => session[:seller_id]
    
    #respond_to do |format|
     # format.html # new.html.erb
      #format.json { render json: @car }
    #end
  end

  # GET /cars/1/edit
  def edit
    #@car = Car.find(params[:id])
    #@seller = Seller.find(session[:seller_id])
    @seller = Seller.find(params[:seller_id])
    @car = @seller.cars.find(params[:id])
  end

  # POST /cars
  # POST /cars.json
  def create
    #@car = Car.new (params[:car][:brand])
    @seller = Seller.find(params[:seller_id])
    #Correct @car = @seller.cars.build(:seller_id => @seller)
    @car = @seller.cars.build(params[:car])
    @car.save
    if @car.save
     flash[:notice] = "A New Car Advert Has Been Created!"
     redirect_to seller_url(@car.seller_id)
     
     else 
     render :action => 'new'
    end
  
    #render :text => "Test"
  end

  # PUT /cars/1
  # PUT /cars/1.json
  def update
    #@car = Car.find(params[:id])
    @seller = Seller.find(params[:seller_id])
    @car = @seller.cars.find(params[:id])
    if @car.update_attributes(params[:car])
    flash[:notice] = "Car advert successfully updated!"
    redirect_to seller_url(@car.seller_id)
    else
    render :action => 'edit'
    end
    #respond_to do |format|
     # if @car.update_attributes(params[:car])
      #  format.html { redirect_to @car, notice: 'Car was successfully updated.' }
       # format.json { head :ok }
      #else
       # format.html { render action: "edit" }
        #format.json { render json: @car.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @seller = Seller.find(params[:seller_id])
    @car = @seller.cars.find(params[:id])
    @car.destroy

     flash[:notice] = "Advert Deleted"
     redirect_to seller_cars_path(session[:seller_id])

     #respond_to do |format|
     #format.html { redirect_to cars_url }
     #format.json { head :ok }
     #end
  end
end
