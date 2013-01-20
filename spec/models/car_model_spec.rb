require 'spec_helper'

describe Car do

 it "fields are required" do
   Car.new(:brand => "test").should have(0).errors_on(:brand)

  end


end
