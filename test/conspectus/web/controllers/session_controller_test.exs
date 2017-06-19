defmodule Conspectus.Web.SessionControllerTest do
  use Conspectus.Web.ConnCase

  describe "POST /api/sign_up" do
    test "successful signup returns created user", %{conn: conn} do
      conn = post(conn, "/api/sign_up", [email: "test@mail.com", password: "test123"])
      assert %{"email" => "test@mail.com"} = json_response(conn, 200)
    end

    test "unsuccessful signup returns errors", %{conn: conn} do
      conn = post(conn, "/api/sign_up", [email: "wrong mail.com", password: "test123"])
      assert %{"errors" => _errors} = json_response(conn, 403)
    end
  end

  describe "POST /api/sign_in" do
    test "successful sign-in returns user data", %{conn: conn} do
      user = insert(:user)
      email = user.email

      conn = post(conn, "/api/sign_in", [email: email, password: "password123"])

      assert %{"email" => ^email} = json_response(conn, 200)
    end
  end
end
