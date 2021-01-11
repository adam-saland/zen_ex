defmodule ZenEx.Entity.OrganizationMembership do
  @moduledoc """
  Identity entity corresponding to Zendesk Organization Memberships
  """

  defstruct [
    :created_at,
    :default,
    :id,
    :organization_id,
    :updated_at,
    :user_id
  ]
end
