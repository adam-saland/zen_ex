defmodule ZenEx.Model.OrganizationMembership do
  @moduledoc """
  Provides functions for retreiving and manipulating Organization membership 
  """

  alias ZenEx.{HTTPClient, Query}
  alias ZenEx.Entity.{Organization, OrganizationMembership, User}

  @doc """
  List all of a user's organizations.
  """

  @spec list(%User{} | %Organization{}, keyword()) :: %ZenEx.Collection{} | {:error, String.t()}
  def list(resource, opts \\ [])

  def list(%User{id: user_id}, opts) when is_list(opts) do
    HTTPClient.get("/api/v2/users/#{user_id}/organizations_memberships.json#{Query.build(opts)}",
      organization_memberships: [OrganizationMembership]
    )
  end

  @doc """
  List all members in a given organizations.
  """

  def list(%Organization{id: organization_id}, opts) when is_list(opts) do
    HTTPClient.get(
      "/api/v2/organizations/#{organization_id}/organizations_memberships.json#{Query.build(opts)}",
      organization_memberships: [OrganizationMembership]
    )
  end

  @doc """
  Creates a new Organization Membership

  ## Examples

      iex> ZenEx.Model.OrganizationMembership.create(%ZenEx.Entity.Organization{}, %ZenEx.Entity.User{})
      %ZenEx.Entity.OrganizationMembership{}
  """
  def create(%Organization{id: organization_id}, %User{id: user_id}) do
    member = %{organization_id: organization_id, user_id: user_id}

    HTTPClient.post("/api/v2/organization_memberships.json", %{organization_membership: member},
      organization: Organization
    )
  end
end
