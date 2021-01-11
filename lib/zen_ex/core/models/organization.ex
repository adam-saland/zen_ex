defmodule ZenEx.Model.Organization do
  @moduledoc """
  Provides functions for retreiving and manipulating User organizations
  """

  alias ZenEx.{HTTPClient, Query, SearchQuery}
  alias ZenEx.Entity.{Organization, User}

  @doc """
  List all of a user's organizations.
  """
  @spec list(%User{} | keyword) :: %ZenEx.Collection{} | {:error, String.t({})}
  def list(opts \\ [])

  def list(%User{id: user_id}) do
    HTTPClient.get("/api/v2/users/#{user_id}/organizations.json",
      organizations: [Organization]
    )
  end

  @doc """
  List all organizations.

  ## Examples

      iex> ZenEx.Model.Organization.list()
      %ZenEx.Collection{}

  """
  def list(opts) when is_list(opts) do
    HTTPClient.get("/api/v2/organizations.json#{Query.build(opts)}", organizations: [Organization])
  end

  @doc """
  Show specific user's organization by id.

  ## Examples

      iex> ZenEx.Model.Organization.show(1)
      %ZenEx.Entity.Organization{id: 1, name: "xxx", ...}

  """
  @spec show(integer) :: %Organization{} | {:error, String.t()}
  def show(id) when is_integer(id) do
    HTTPClient.get("/api/v2/organizations/#{id}.json", organization: Organization)
  end

  @doc """
  Creates a new User Organization

  ## Examples

      iex> ZenEx.Model.Organization.create(%ZenEx.Entity.Organization{name: "xxx"})
      %ZenEx.Entity.Organization{name: "xxx"}
  """
  def create(%Organization{} = organization) do
    HTTPClient.post("/api/v2/organizations.json", %{organization: organization},
      organization: Organization
    )
  end

  @doc """
  Search for Organizations specified by query.

  ## Examples

      iex> ZenEx.Model.Organization.search(%{})
      %ZenEx.Collection{}

  """
  @spec search(map()) :: %ZenEx.Collection{} | {:error, String.t()}
  def search(opts) when is_map(opts) do
    opts
    |> SearchQuery.build()
    |> search()
  end

  @spec search(String.t()) :: %ZenEx.Collection{} | {:error, String.t()}
  def search(query) do
    HTTPClient.get("/api/v2/organization/search.json?query=#{query}", results: [Organization])
  end
end
