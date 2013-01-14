class PagesController < ApplicationController
skip_before_filter :require_seller
def used
  @cars = Car.all
  @car = Car.new
end

def about
end

def contact
end

end
