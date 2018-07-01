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

    post("/sign_up", UserController, :create)
    post("/sign_in", UserController, :sign_in)
  end

  scope "/api/v1", MyAppWeb do
    pipe_through([:api, :jwt_authenticated])

    get("/me", UserController, :show)
  end
end
