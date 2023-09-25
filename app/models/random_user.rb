class RandomUser < ApplicationRecord
  validates :gender, presence: true

  belongs_to :name
  belongs_to :location

  validates :email, presence: true

  belongs_to :login
  belongs_to :dob
  belongs_to :registered

  validates :phone, presence: true
  validates :cell, presence: true

  belongs_to :ruid
  belongs_to :picture

  validates :nat, presence: true
end
