class Reservation < ActiveRecord::Base
  belongs_to :photographer
  belongs_to :customer
end
