class CorrectiveAction < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name           :string
    assigned_to    :string
    completed_by   :string
    completed_date :date
    reviewed_by    :string
    reviewer_ob    :html
    rev_interview  :html
    rev_docs       :html
    ca_status enum_string(:Requested, :Recieved, :Reviewed, :Requested_Additional_Clarification)
    timestamps
  end

  #never_show :reviewer_ob

  belongs_to :tcl

  def name_edit_permitted?
    acting_user.program? || acting_user.administrator?
  end

  def assigned_to_edit_permitted?
    acting_user.program? || acting_user.administrator?
  end

  def completed_by_edit_permitted?
    acting_user.program? || acting_user.administrator?
  end

  def completed_date_edit_permitted?
    acting_user.program? || acting_user.administrator?
  end

  def reviewed_by_edit_permitted?
    acting_user.reviewer? || acting_user.administrator?
  end

  def reviewed_by_view_permitted?
    acting_user.reviewer? || acting_user.administrator?
  end

  def reviewer_ob_edit_permitted?
    acting_user.reviewer? || acting_user.administrator?
  end

  def reviewer_ob_view_permitted?
    acting_user.reviewer? || acting_user.administrator?
  end

  def rev_interview_edit_permitted?
    acting_user.reviewer? || acting_user.administrator?
  end

  def rev_interview_view_permitted?
    acting_user.reviewer? || acting_user.administrator?
  end

  def rev_docs_edit_permitted?
    acting_user.reviewer? || acting_user.administrator?
  end

  def rev_docs_view_permitted?
    acting_user.reviewer? || acting_user.administrator?
  end

  def ca_status_edit_permitted?
    acting_user.reviewer? || acting_user.administrator?
  end

  def ca_status_view_permitted?
    acting_user.reviewer? || acting_user.administrator?
  end

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? || acting_user.program?
  end

  def update_permitted?
    acting_user.signed_up?
  end

  def destroy_permitted?
    acting_user.signed_up?
  end

  def view_permitted?(field)
    true
  end

end
