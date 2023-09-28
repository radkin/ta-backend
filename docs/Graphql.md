# Install GraphQL for rails

```bash
bundle add graphql
rails g graphql:install
```

`config/initializers/graphiql.rb`

```ruby
GraphiQL::Rails.config.header_editor_enabled = true
```

`rails s`

# Test GraphQL in the browser
`http://localhost:3000/graphiql`

```graphql
query {
    testField
}
```

# Create your GraphQL schema
```bash
rails g graphql:object randomUser
rails g graphql:object name
rails g graphql:object location
rails g graphql:object login
rails g graphql:object dob
rails g graphql:object registered
rails g graphql:object id
rails g graphql:object picture
```

Note: if, for some reason your type is not defined, this is an example:

`app/graphql/types/random_user_type.rb`
```ruby
# frozen_string_literal: true
module Types
    class RandomUserType < Types::BaseObject
    field :gender, String, null:false
    field :name, NameType, null:false
    field :location, LocationType, null:false
    field :email, String, null:false
    field :login, LoginType, null:false
    field :dob, DobType, null:false
    field :registered, RegisteredType, null:false
    field :phone, String, null:false
    field :cell, String, null:false
    field :picture, PictureType, null:false
    field :nat, String, null:false
    end
end
```

# Create GraphQL boilderplate

`app/graphql/queries/base_query.rb`
```ruby
module Queries
    class BaseQuery < GraphQL::Schema::Resolver
    end
end
```

## Example query

`app/graphql/queries/fetch_users.rb`
```ruby
module Queries
  
    class FetchUsers < Queries::BaseQuery
        require_relative '../../services/remote_random_user'
        require 'json'type [Types::RandomUserType ], null: false
    
        def resolve(**args)
            # Return all RandomUser objects in the database
            RandomUser.all
        end
    end
end
```

>*Note: I combined the above with fetching the users so that you can see the present users and fetch a new one every time
you run the query. There is a service for this and it is triggered here. That code has been omitted.*

## Set the query type

`app/graphql/types/query_type.rb`

```ruby
field :fetch_users, resolver: Queries::FetchUsers
```

```bash
ctrl-c
rails s
```

## Test the new GraphQL schema

Test something new in the schema:
```graphql
query {
    fetchUsers {
        name {
        last
        }
    }
}
```

If you have not added data to the DB, the result should look like this
```graphql
{
    "data": {
        "fetchUsers": []
    }
}
```