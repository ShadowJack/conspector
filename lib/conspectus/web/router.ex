defmodule Conspectus.Web.Router do
  use Conspectus.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :protect_from_forgery
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  scope "/", Conspectus.Web do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api/", Conspectus.Web do
    pipe_through :api

    post "/sign_up", SessionController, :sign_up
    post "/sign_in", SessionController, :sign_in
  end

  # Other scopes may use custom stacks.
  # scope "/api", Conspectus.Web do
  #   pipe_through :api
  # end
end
