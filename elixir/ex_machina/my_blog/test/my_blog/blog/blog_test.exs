defmodule MyBlog.BlogTest do
  use MyBlog.DataCase

  alias MyBlog.Blog

  import MyBlog.Factory

  describe "posts" do
    alias MyBlog.Blog.Post

    test "get_post!/1 returns the post with given id" do
      post = insert(:post)
      comments = insert_list(5, :comment, post: post)
      IO.inspect comments
      #TODO test POST

    end
  end

  describe "comments" do
    alias MyBlog.Blog.Comment

    @valid_attrs %{body: "some body", name: "some name"}
    @update_attrs %{body: "some updated body", name: "some updated name"}
    @invalid_attrs %{body: nil, name: nil}

    def comment_fixture(attrs \\ %{}) do
      {:ok, comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_comment()

      comment
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()

      #TODO test comment

    end
  end
end
