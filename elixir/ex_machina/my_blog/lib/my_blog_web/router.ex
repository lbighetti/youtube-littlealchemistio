defmodule MyBlogWeb.Router do
  use MyBlogWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MyBlogWeb do
    pipe_through :api

    resources "/posts", PostController, except: [:new, :edit]
    resources "/comments", CommentController, except: [:new, :edit]
  end
end
