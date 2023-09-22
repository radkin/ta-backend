# frozen_string_literal: true

module Types
  class PictureType < Types::BaseObject
    field :id, ID, null: false
    field :large, String
    field :medium, String
    field :thumbnail, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
