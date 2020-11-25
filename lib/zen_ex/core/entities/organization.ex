defmodule ZenEx.Entity.Organization do
  @moduledoc """
  Identity entity corresponding to Zendesk Organization 
  """

  defstruct [
    :created_at,
    :details,
    :domain_names,
    :external_id,
    :group_id,
    :id,
    :name,
    :notes,
    :organization_fields,
    :shared_comments,
    :shared_tickets,
    :tags,
    :updated_at,
    :url
  ]
end
