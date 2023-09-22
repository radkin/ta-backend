# frozen_string_literal: true

module Types
  class LocationType < Types::BaseObject
    field :id, ID, null: false
    field :city, String
    field :state, String
    field :country, String
    field :postcode, String
    field :coordinates_id, Integer, null: false
    field :timezone_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
