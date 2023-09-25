module Queries
  class FetchUsers < Queries::BaseQuery

    require_relative '../../services/remote_random_user'
    require_relative '../../../lib/random_user_me'

    require 'json'

    type [Types::RandomUserType ], null: false

    def resolve(**args)
      rru = RemoteRandomUser.new('https://randomuser.me/api')
      response = rru.gather

      data = JSON.parse(response)
      random_user_data = data['results'][0]

      # build the name object
      this_name = Name.new(
        title: random_user_data["name"]["title"],
        first: random_user_data["name"]["first"],
        last: random_user_data["name"]["last"]
      )

      # build the location object
      street = random_user_data["location"]["street"]
      timezone = random_user_data["location"]["timezone"]

      this_street = Street.new(street)

      this_coordinate = Coordinate.new(
        longitude: random_user_data["location"]["coordinates"]["longitude"],
        latitude: random_user_data["location"]["coordinates"]["latitude"]
      )
      this_timezone = Timezone.new(timezone)

      this_location = Location.new(
        street: this_street,
        city: random_user_data["location"]["city"],
        state: random_user_data["location"]["state"],
        country: random_user_data["location"]["country"],
        postcode: random_user_data["location"]["postcode"],
        coordinate: this_coordinate,
        timezone: this_timezone
      )

      # build the login object
      this_login = Login.new(
        uuid: random_user_data["uuid"],
        username: random_user_data["username"],
        password: random_user_data["password"],
        salt: random_user_data["salt"],
        md5: random_user_data["md5"],
        sha1: random_user_data["sha1"],
        sha256: random_user_data["sha256"]
      )

      # build dob object
      this_dob = Dob.new(
        date: random_user_data["dob"]["date"],
        age: random_user_data["dob"]["age"]
      )

      # build registered object
      this_registered = Registered.new(
        date: random_user_data["registered"]["date"],
        age: random_user_data["registered"]["age"]
      )

      # build the random user ID object
      this_ruid = Ruid.new(
        name:random_user_data["id"]["name"],
        value:random_user_data["id"]["value"]
      )

      # build the picture object
      this_picture = Picture.new(
        large:random_user_data["picture"]["large"],
        medium:random_user_data["picture"]["medium"],
        thumbnail: random_user_data["picture"]["thumbnail"]
      )

      randomUser = RandomUser.new(
        gender: random_user_data["gender"],
        name: this_name,
        location: this_location,
        email: random_user_data["email"],
        login: this_login,
        dob: this_dob,
        registered: this_registered,
        phone: random_user_data["phone"],
        cell: random_user_data["cell"],
        ruid: this_ruid,
        picture: this_picture,
        nat: random_user_data["nat"]
      )



      # mapped_random_user.inspect


      # rru.remote_user = name
      #
      # rru.update_local

      RandomUser.all
    end

  end
end