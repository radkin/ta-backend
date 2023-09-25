class Name < ApplicationRecord
  validates :title, presence: true
  validates :first, presence: true
  validates :last, presence: true
end
