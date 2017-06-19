defmodule Conspectus.Web.SessionView do
  use Conspectus.Web, :view

  def render("sign_up.json", %{user: user}) do
    %{
      email: user.email
    }
  end

  def render("sign_in.json", %{user: user}) do
    %{
      email: user.email,
      username: user.username,
      first_name: user.first_name,
      last_name: user.last_name
    }
  end
end
