# ActiveRecord
## Generate the models
Example <this is an incomplete list of models>
```bash
rails generate model Street number:string name:string
rails generate model Coordinates latitude:string longitude:string
rails generate model Timezone offset:string description:string
rails generate model Location city:string state:string country:string
postcode:string coordinates:references timezone:references
rails generate model Registered date:string age:integer
rails generate model Login uuid:string username:string password:string
salt:string md5:string sha1:string sha256:string
rails generate model Name title:string first:string last:string
rails generate model Dob date:string age:integer
rails generate model Ruid name:string value:string
rails generate model Picture large:string medium:string thumbnail:string
rails generate model RandomUser gender:string name:references
location:references email:string login:references dob:references
registered:references phone:string cell:string ruid:references
picture:references nat:string
```
**Note:** It is important you watch the creation of each of these models.
It is possible that one of them will fail and some action will be required.
## Manually update the models
### Examples:

Number 1:

`app/models/random_user.rb`
```ruby
class RandomUser < ApplicationRecord
    validates :gender, presence: true
    belongs_to :name
    belongs_to :location
    validates :email, presence: truebelongs_to :login
    belongs_to :dob
    belongs_to :registered
    validates :phone, presence: true
    validates :cell, presence: true
    belongs_to :ruid
    belongs_to :picture
    validates :nat, presence: true
end
```
Number 2:
`app/models/coordinate.rb`
```ruby
class Coordinate < ApplicationRecord
    validates :latitude, presence: true
    validates :longitude, presence: true
end
```

`rails db:migrate`

>
> *If a migrations fails, it is likely because one of the migrations is out of order. If that
is the case, simply rename them to change the order. Swap out the numbers at
the end.*

### Test schema in the rails console

`rails c`

```ruby
timezone = Timezone.create(offset: "haza", description: "awesome zone")
puts timezone.inspect
```

## Create a service to gather data from a remote REST API

`app/services/remote_random_user.rb`

```ruby
# frozen_string_literal: true
require 'rest-client'class RemoteRandomUser
  attr_accessor :url, :remote_user
  
    def initialize(url, remote_user = nil)
        @url = url
        @remote_user = remote_user
    end
  
    def gather
        RestClient.get(@url)  
    end
end
```

## Use the rails console to complete your service layer

`rails c`

```ruby
rru = RemoteRandomUser.new('https://randomuser.me/api')
response = rru.gather
data = JSON.parse(response)
random_user_data = data['results'][0]
random_user_data
```

The above will create a record with data from the REST API manually.
This allows you to rapidly generate code that has models, tables, and data types
that conform to the data that comes from your remote backend server. Test each step as you go.
Resist the temptation to copy it all and paste in the console to save time. It's worth checking
each step.

```ruby
random_user = RandomUser.create(gender: random_user_data['gender'], email:
random_user_data['email'], nat: random_user_data['nat'], location:
this_location)
random_user.save!
```

## Fix the schema as needed

Here are some examples of ways you can correct incorrectly defined schemas

```bash
rails g migration update_random_users
rails g migration update_coordinates
rails g migration remove_street_from_random_users
```

```ruby
class CreateRandomUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :random_users do |t|
    t.string :gender
    t.references :name, null: false, foreign_key: true
    t.references :location, null: false, foreign_key: true
    t.string :email
    t.references :login, null: false, foreign_key: true
    t.references :dob, null: false, foreign_key: true
    t.references :registered, null: false, foreign_key: true
    t.string :phone
    t.string :cell
    t.references :ruid, null: false, foreign_key: true
    t.references :picture, null: false, foreign_key: true
    t.string :nat
    t.timestamps
    end
end

```

```ruby
class CreateStreets < ActiveRecord::Migration[7.0]
    def change
        create_table :streets do |t|
        t.string :number
        t.string :name
        t.timestamps
        end
    end 
end

```

```ruby
class UpdateRandomUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :random_users, :street, null: false, foreign_key: true
  end
end
```

```ruby
class RemoveStreetFromRandomUsers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :random_users, :street, null: false, foreign_key: true
  end
end
```

