defmodule Conspectus.Web.SessionController do
  use Conspectus.Web, :controller
  alias Conspectus.Accounts

  @doc """
  Create a new user
  """
  def sign_up(conn, params) do
    case Accounts.create_user(params) do
      {:ok, user} -> 
        render(conn, user: user)
      {:error, changeset} -> 
        conn 
        |> put_status(403)
        |> render(Conspectus.Web.ErrorView, "error.json", errors: changeset.errors)
    end
  end

  @doc """
  Create a new user session
  """
  def sign_in(conn, %{"email" => email, "password" => pw}) do
    case Accounts.get_user(email, pw) do
      {:ok, user} -> 
        conn
        |> Guardian.Plug.sign_in(user)
        |> render(user: user)
      {:error, reason} -> 
        conn
        |> put_status(404)
        |> render(Conspectus.Web.ErrorView, "error.json", errors: [{reason, to_string(reason)}])
    end
  end
end
