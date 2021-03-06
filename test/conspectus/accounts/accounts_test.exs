defmodule Conspectus.AccountsTest do
  use Conspectus.DataCase

  alias Conspectus.Accounts

  describe "users" do
    alias Conspectus.Accounts.User

    @valid_attrs %{email: "some@email.com", first_name: "some first_name", last_name: "some last_name", password: "some password", username: "some username"}
    @update_attrs %{email: "some@updated_email.com", first_name: "some updated first_name", last_name: "some updated last_name", password: "some updated password", username: "some updated username"}
    @invalid_attrs %{email: "wrong email", first_name: nil, last_name: nil, password: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      user_id = user.id
      assert [%User{id: ^user_id}] = Accounts.list_users() 
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      user_id = user.id
      assert Accounts.get_user!(user.id).id == user_id
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some@email.com"
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
      assert user.password_hash != ""
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
      assert user.username == "some updated username"
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
