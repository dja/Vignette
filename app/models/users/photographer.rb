class Photographer < User
  # Methods, variables and constants

  has_many :albums, class_name: 'Album', foreign_key: 'photographer_id'
  accepts_nested_attributes_for :albums

end