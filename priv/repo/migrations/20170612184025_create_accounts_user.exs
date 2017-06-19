defmodule Conspectus.Repo.Migrations.CreateConspectus.Accounts.User do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :username, :string
      add :first_name, :string
      add :last_name, :string
      add :password_hash, :string

      timestamps()
    end

  end
end
