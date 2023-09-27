# frozen_string_literal: true

module Types
  class RandomUserType < Types::BaseObject

    field :gender, String, null:false
    field :name, NameType, null:false
    field :location, LocationType, null:false
    field :email, String, null:false
    field :login, LoginType, null:false
    field :dob, DobType, null:false
    field :registered, RegisteredType, null:false
    field :phone, String, null:false
    field :cell, String, null:false

    field :picture, PictureType, null:false
    field :nat, String, null:false

  end
end
