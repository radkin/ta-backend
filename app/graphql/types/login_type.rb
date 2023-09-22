# frozen_string_literal: true

module Types
  class LoginType < Types::BaseObject
    field :id, ID, null: false
    field :uuid, String
    field :username, String
    field :password, String
    field :salt, String
    field :md5, String
    field :sha1, String
    field :sha256, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
