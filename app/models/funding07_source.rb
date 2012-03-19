class Funding07Source < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    source :string
    timestamps
  end

  belongs_to :program

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
