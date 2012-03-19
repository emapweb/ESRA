class TclGoal < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name  :string
    timestamps
  end

  belongs_to :tcl

  # --- Permissions --- #

  def create_permitted?
    acting_user.signed_up?
  end

  def update_permitted?
    acting_user.signed_up?
  end

  def destroy_permitted?
    acting_user.signed_up?
  end

  def view_permitted?(field)
    acting_user.signed_up?
  end

end
