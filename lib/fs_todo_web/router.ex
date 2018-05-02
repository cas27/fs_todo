defmodule FsTodoWeb.Router do
  use FsTodoWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  if Mix.env() == :dev do
    forward(
      "graphiql",
      Absinthe.Plug.GraphiQL,
      schema: FsTodoWeb.Schema
    )
  end

  scope "/", FsTodoWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  # Other scopes may use custom stacks.
  # scope "/api", FsTodoWeb do
  #   pipe_through :api
  # end
end
