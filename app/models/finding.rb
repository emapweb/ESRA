class Finding < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name           :string
    summary        :html
    recommendation :html
    timestamps
  end

  belongs_to :review
  belongs_to :program

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? || acting_user.reviewer?
  end

  def update_permitted?
    acting_user.administrator? || acting_user.reviewer?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    acting_user.administrator? || acting_user.reviewer?
  end

end
