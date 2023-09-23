module Queries
  class FetchUsers < Queries::BaseQuery

    require_relative '../../services/remote_random_user'

    type [Types::RandomUserType ], null: false

    def resolve(**args)
      rru = RemoteRandomUser.new('https://randomuser.me/api')
      response = rru.gather

      data = JSON.parse(response)
      rru.remote_user = data['results'][0]
      rru.update_local

      RandomUser.all
    end

  end
end