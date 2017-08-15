defmodule MyBlog.BlogTest do
  use MyBlog.DataCase

  alias MyBlog.Blog

  describe "posts" do
    alias MyBlog.Blog.Post

    @valid_attrs %{author: "some author", content: "some content", title: "some title"}
    @update_attrs %{author: "some updated author", content: "some updated content", title: "some updated title"}
    @invalid_attrs %{author: nil, content: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_post()

      post
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()

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
