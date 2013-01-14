class Car < ActiveRecord::Base
validates :mileage, :cc, :notes, :numericality => true
validates :brand, :model, :color, :year, :mileage, :cc, :notes, :presence =>true

belongs_to :seller
has_many :comments

  attr_accessible :photo, :brand, :model, :color, :year, :mileage, :cc, :transmission, :ac, :power_steering, :electric_glasses, :doors, :notes
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
