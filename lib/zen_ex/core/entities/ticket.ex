defmodule ZenEx.Entity.Ticket do
  defstruct [
    :assignee_id,
    :collaborator_ids,
    :comment,
    :created_at,
    :custom_fields,
    :description,
    :due_at,
    :external_id,
    :forum_topic_id,
    :group_id,
    :has_incidents,
    :id,
    :organization_id,
    :priority,
    :problem_id,
    :raw_subject,
    :recipient,
    :requester_id,
    :satisfaction_rating,
    :sharing_agreement_ids,
    :status,
    :subject,
    :submitter_id,
    :tags,
    :ticket_form_id,
    :type,
    :updated_at,
    :url,
    :via
  ]

  @moduledoc """
  Ticket entity corresponding to Zendesk Ticket
  """
end
