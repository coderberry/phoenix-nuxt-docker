defmodule MyAppWeb.Router do
  use MyAppWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(Guardian.Plug.VerifyHeader)
    plug(Guardian.Plug.LoadResource)
  end

  pipeline :authenticated do
    plug(Guardian.Plug.EnsureAuthenticated)
  end

  scope "/api/v1", MyAppWeb do
    pipe_through(:api)

    # restrict unauthenticated access for routes below
    pipe_through(:authenticated)

    resources("/users", UserController, except: [:new, :edit])
  end
end
