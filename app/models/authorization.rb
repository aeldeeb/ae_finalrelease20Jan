class Authorization < ActiveRecord::Base
belongs_to :seller
validates :provider, :uid, :presence => true
end
