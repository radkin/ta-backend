# frozen_string_literal: true

module Types
  class IdType < Types::BaseObject
    field :name, String, null:false
    field :value, String, null:false
  end
end
