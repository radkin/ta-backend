# frozen_string_literal: true

module Types
  class NameType < Types::BaseObject
    field :title, String
    field :first, String
    field :last, String
  end
end
