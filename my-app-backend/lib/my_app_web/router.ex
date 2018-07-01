defmodule MyAppWeb.Router do
  use MyAppWeb, :router

  alias MyApp.Guardian

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :jwt_authenticated do
    plug(Guardian.AuthPipeline)
  end

  scope "/api/v1", MyAppWeb do
    pipe_through(:api)

    post("/signup", UserController, :create)
    post("/login", UserController, :sign_in)
  end

  scope "/api/v1", MyAppWeb do
    pipe_through([:api, :jwt_authenticated])

    get("/me", UserController, :show)
  end
end
