defmodule Conspectus.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Conspectus.Accounts.User
  alias Comeonin.Bcrypt


  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :username, :string

    timestamps()
  end

  @doc """
  Changeset for user registration data
  """
  def sign_up_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :username, :first_name, :last_name, :password])
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> hash_password()
  end

  @doc """
  Changeset for user registration data
  """
  def update_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :first_name, :last_name])
  end

  defp hash_password(changeset) do
    if changeset.valid? do
      hash = get_change(changeset, :password) |> Bcrypt.hashpwsalt()
      changeset |> put_change(:password_hash, hash)
    else
      changeset
    end
  end
end
