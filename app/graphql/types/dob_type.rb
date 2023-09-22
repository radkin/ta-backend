# frozen_string_literal: true

module Types
  class DobType < Types::BaseObject
    field :id, ID, null: false
    field :date, String
    field :age, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
