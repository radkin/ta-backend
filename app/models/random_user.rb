class RandomUser < ApplicationRecord
  belongs_to :name
  belongs_to :location
  belongs_to :login
  belongs_to :dob
  belongs_to :registered
  belongs_to :ruid
  belongs_to :picture
end
