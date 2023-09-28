# CORS and Routing

## Why add CORS?
It is a quick way to set up the front-end without making any changes there.
We could send the header that indicates our origin and set it for localhost in JS like this,
but we're going to do all the legwork in the backend for this example code. None of this is
recommended because using CORS correctly is a _really_ good idea.

```javascript
fetch('https://example.com/api/data', {
  method: 'GET', // or any other HTTP method (e.g., POST)
  headers: {
    'Origin': 'https://your-client-domain.com', // Replace with your client's domain
    'Access-Control-Request-Method': 'GET', // The HTTP method you intend to use
    'Access-Control-Request-Headers': 'Authorization', // Optional: specify additional headers
  },
})
```

Please note that rails is not CORS aware the way we have installed it without taking this approach.
If we used `--api` in the creation step things would probably be very different.

## Adding CORS to rails and disabling the check

`bundle add rack-cors`

`config/routes.rb`
```ruby
Rails.application.routes.draw do
    if Rails.env.development?
        mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path:
        "/graphql"
        root to: redirect('/graphiql')
    end
    post "/graphql", to: "graphql#execute"
end
```

`app/controllers/application_controller.rb`
```ruby
class ApiController < ActionController::Base
    skip_before_action :verify_authenticity_token
end
```

`config/initializers/cors.rb`
```ruby
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

```

### Test with curl
Example 1
```bash
curl -X POST -H "Content-Type: application/json" -d '{"query": "query {
fetchUsers { name { first } } }"}' http://localhost:3000/graphql
```
Example 2
```bash
curl -X POST -H "Content-Type: application/json" -d '{"query": "query
{fetchUsers { gender } }"}' http://localhost:3000/graphql
```
