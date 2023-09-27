Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
    root to: redirect('/graphiql')
  end
  post "/graphql", to: "graphql#execute"
end
