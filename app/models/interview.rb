class Interview < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name      :string, :required, :name => true
    title     :string
    idate     :date
    summary   :html
    timestamps
  end



  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? || acting_user.reviewer?
  end

  def update_permitted?
    acting_user.administrator? || acting_user.reviewer?
  end

  def destroy_permitted?
    acting_user.administrator? || acting_user.reviewer?
  end

  def view_permitted?(field)
    acting_user.administrator? || acting_user.reviewer?
  end

end
