defmodule TodoWeb.Router do
  use TodoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TodoWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello/:thing", PageController, :hello
    get "/about", OurController, :index
    resources "/todolist", TodolistController
  end
  
  # Other scopes may use custom stacks.
  scope "/api", TodoWeb do
    pipe_through :api
    resources "/comments", CommentController, except: [:new, :edit]
    resources "/files", FileController, except: [:new, :edit]
  end
end
