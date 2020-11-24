defmodule ZenEx.Entity.OrganizationMembership do
  @moduledoc """
  Identity entity corresponding to Zendesk Organization Memberships
  """

  defstruct [:id, :user_id, :organization_id, :default, :updated_at, :created_at]
end
