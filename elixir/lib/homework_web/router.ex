defmodule HomeworkWeb.Router do
  use HomeworkWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", HomeworkWeb do
    pipe_through(:api)
    resources "/users", UserController
    resources "/merchants", MerchantController
    resources "/transactions", TransactionController
  end

  forward("/graphiql", Absinthe.Plug.GraphiQL,
      schema: HomeworkWeb.Schema,
      interface: :simple,
      context: %{pubsub: HomeworkWeb.Endpoint}
  )
end
