class Location < ApplicationRecord
  belongs_to :street

  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :postcode, presence: true

  belongs_to :coordinate
  belongs_to :timezone

end
