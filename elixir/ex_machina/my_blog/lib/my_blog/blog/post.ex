defmodule MyBlog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias MyBlog.Blog.Post


  schema "posts" do
    field :author, :string
    field :content, :string
    field :title, :string
    has_many :comments, MyBlog.Blog.Comment

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :author, :content])
    |> validate_required([:title, :author, :content])
  end
end
