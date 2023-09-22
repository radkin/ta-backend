module Queries
  class FetchUsers < Queries::BaseQuery

    type [Types::RandomUserType ], null: false

    def resolve(**args)
      RandomUser.all
    end

  end
end