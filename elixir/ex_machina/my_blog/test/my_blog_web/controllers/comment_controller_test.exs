defmodule MyBlogWeb.CommentControllerTest do
  use MyBlogWeb.ConnCase

  alias MyBlog.Blog
  alias MyBlog.Blog.Comment

  @create_attrs %{body: "some body", name: "some name"}
  @update_attrs %{body: "some updated body", name: "some updated name"}
  @invalid_attrs %{body: nil, name: nil}

  def fixture(:comment) do
    {:ok, comment} = Blog.create_comment(@create_attrs)
    comment
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all comments", %{conn: conn} do
      conn = get conn, comment_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create comment" do
    test "renders comment when data is valid", %{conn: conn} do
      conn = post conn, comment_path(conn, :create), comment: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, comment_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "body" => "some body",
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, comment_path(conn, :create), comment: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update comment" do
    setup [:create_comment]

    test "renders comment when data is valid", %{conn: conn, comment: %Comment{id: id} = comment} do
      conn = put conn, comment_path(conn, :update, comment), comment: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, comment_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "body" => "some updated body",
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, comment: comment} do
      conn = put conn, comment_path(conn, :update, comment), comment: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete comment" do
    setup [:create_comment]

    test "deletes chosen comment", %{conn: conn, comment: comment} do
      conn = delete conn, comment_path(conn, :delete, comment)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, comment_path(conn, :show, comment)
      end
    end
  end

  defp create_comment(_) do
    comment = fixture(:comment)
    {:ok, comment: comment}
  end
end
