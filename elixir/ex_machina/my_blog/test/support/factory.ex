defmodule MyBlog.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: MyBlog.Repo
  # 
  # def user_factory do
  #   %MyBlog.User{
  #     name: "Jane Smith",
  #     email: sequence(:email, &"email-#{&1}@example.com"),
  #   }
  # end

  def post_factory do
    %MyBlog.Blog.Post{
      title: "Use ExMachina!",
      content: "My great content",
      author: "John Doe"
    }
  end

  def comment_factory do
    %MyBlog.Blog.Comment{
      body: sequence(:body, &"It's great number #{&1}!"),
      name: "Jonny Doe",
      post: build(:post)
    }
  end
end
