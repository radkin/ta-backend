class Location < ApplicationRecord
  belongs_to :coordinates
  belongs_to :timezone
end
