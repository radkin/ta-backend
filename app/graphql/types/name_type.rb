# frozen_string_literal: true

module Types
  class NameType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :first, String
    field :last, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
