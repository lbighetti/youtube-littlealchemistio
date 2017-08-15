defmodule MyBlog.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias MyBlog.Blog.Comment


  schema "comments" do
    field :body, :string
    field :name, :string
    belongs_to :post, MyBlog.Blog.Post

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:name, :body])
    |> validate_required([:name, :body])
  end
end
