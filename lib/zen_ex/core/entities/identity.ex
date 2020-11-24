defmodule ZenEx.Entity.Identity do
  @moduledoc """
  Identity entity corresponding to Zendesk User Identity
  """

  defstruct [:id, :user_id, :type, :value, :verified, :primary, :updated_at, :created_at]
end
