defmodule ZenEx.Model.Identity do
  @moduledoc """
  Provides functions for retreiving and manipulating User Identities
  """

  alias ZenEx.{HTTPClient, Query}
  alias ZenEx.Entity.{Identity, User}

  @doc """
  List user's identities.

  ## Examples

      iex> ZenEx.Model.Identity.list(%User{})
      %ZenEx.Collection{}

  """
  @spec list(%User{}, keyword) :: %ZenEx.Collection{} | {:error, String.t()}
  def list(%User{id: user_id}, opts \\ []) when is_list(opts) do
    HTTPClient.get("/api/v2/users/#{user_id}/identities.json#{Query.build(opts)}",
      identities: [Identity]
    )
  end

  @doc """
  Show specific user's identity by id.

  ## Examples

      iex> ZenEx.Model.Identity.show(%User{}, 1)
      %ZenEx.Entity.Identity{id: 1, name: "xxx", ...}

  """
  @spec show(%User{}, integer) :: %Identity{} | {:error, String.t()}
  def show(%User{id: user_id}, id) when is_integer(id) do
    HTTPClient.get("/api/v2/users/#{user_id}/identities/#{id}.json", identity: Identity)
  end

  @doc """
  Creates a new User Identity

  ## Examples

      iex> ZenEx.Model.Identity.create(%ZenEx.Entity.Identity{name: "xxx"})
      %ZenEx.Entity.Identity{name: "xxx"}
  """
  def create(%Identity{user_id: user_id} = identity) do
    HTTPClient.post("/api/v2/users/#{user_id}/identities.json", %{identity: identity},
      identity: Identity
    )
  end

  @doc """
  Makes an identity the primary for a user

  ## Examples

      iex> ZenEx.Model.Identity.make_primary(%ZenEx.Entity.Identity{name: "xxx"})
      %ZenEx.Entity.Identity{name: "xxx"}
  """
  def make_primary(%Identity{id: id, user_id: user_id}) do
    HTTPClient.put("/api/v2/users/#{user_id}/identities/#{id}/make_primary.json", %{},
      identity: Identity
    )
  end
end
