defmodule ZenEx.Entity.Organization do
  @moduledoc """
  Identity entity corresponding to Zendesk Organization 
  """

  defstruct [:id, :url, :external_id, :name, :updated_at, :created_at, :domain_names, :details, :notes, :group_id, 
    :shared_tickets, :shared_comments, :tags, :organization_fields]
end
