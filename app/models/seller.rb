class Seller < ActiveRecord::Base
validates :name, :phone, :email, :city, :presence => true
validates :phone, :numericality => true
validates :email, :format => { :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i}

has_many :authorizations
has_many :cars
end
