defmodule Conspectus.Factory do
  use ExMachina.Ecto, repo: Conspectus.Repo

  def user_factory do
    %Conspectus.Accounts.User{
      email: sequence(:email, &"test-#{&1}@mail.com"),
      username: "Test user",
      password_hash: Comeonin.Bcrypt.hashpwsalt("password123")
    }
  end
end
