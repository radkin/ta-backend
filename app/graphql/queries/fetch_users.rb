module Queries
  class FetchUsers < Queries::BaseQuery

    require_relative '../../services/remote_random_user'
    require 'json'

    type [Types::RandomUserType ], null: false

    def resolve(**args)
      # Fetch the random user data
      rru = RemoteRandomUser.new('https://randomuser.me/api')
      response = rru.gather
      data = JSON.parse(response)
      random_user_data = data['results'][0]

      # Build the RandomUser object
      random_user = RandomUser.new(
        gender: random_user_data["gender"],
        name: build_name(random_user_data),
        location: build_location(random_user_data),
        email: random_user_data["email"],
        login: build_login(random_user_data),
        dob: build_dob(random_user_data),
        registered: build_registered(random_user_data),
        phone: random_user_data["phone"],
        cell: random_user_data["cell"],
        ruid: build_ruid(random_user_data),
        picture: build_picture(random_user_data),
        nat: random_user_data["nat"]
      )

      # Save the RandomUser object to the database
      random_user.save!

      # Return all RandomUser objects in the database
      RandomUser.all
    end

    private

    def build_name(random_user_data)
      Name.new(
        title: random_user_data["name"]["title"],
        first: random_user_data["name"]["first"],
        last: random_user_data["name"]["last"]
      )
    end

    def build_location(random_user_data)
      street = random_user_data["location"]["street"]
      timezone = random_user_data["location"]["timezone"]

      this_street = Street.new(street)

      this_coordinate = Coordinate.new(
        longitude: random_user_data["location"]["coordinates"]["longitude"],
        latitude: random_user_data["location"]["coordinates"]["latitude"]
      )
      this_timezone = Timezone.new(timezone)

      Location.new(
        street: this_street,
        city: random_user_data["location"]["city"],
        state: random_user_data["location"]["state"],
        country: random_user_data["location"]["country"],
        postcode: random_user_data["location"]["postcode"],
        coordinate: this_coordinate,
        timezone: this_timezone
      )
    end

    def build_login(random_user_data)
      Login.new(
        uuid: random_user_data["uuid"],
        username: random_user_data["username"],
        password: random_user_data["password"],
        salt: random_user_data["salt"],
        md5: random_user_data["md5"],
        sha1: random_user_data["sha1"],
        sha256: random_user_data["sha256"]
      )
    end

    def build_dob(random_user_data)
      Dob.new(
        date: random_user_data["dob"]["date"],
        age: random_user_data["dob"]["age"]
      )
    end

    def build_registered(random_user_data)
      Registered.new(
        date: random_user_data["registered"]["date"],
        age: random_user_data["registered"]["age"]
      )
    end

    def build_ruid(random_user_data)
      Ruid.new(
        name:random_user_data["id"]["name"],
        value:random_user_data["id"]["value"]
      )
    end

    def build_picture(random_user_data)
      Picture.new(
        large:random_user_data["picture"]["large"],
        medium:random_user_data["picture"]["medium"],
        thumbnail: random_user_data["picture"]["thumbnail"]
      )
    end

  end
end