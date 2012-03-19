class Hira < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string, :default => 'HIRA'
    matching    :boolean
    description :html
    timestamps
  end

  has_many :hazards, :dependent => :destroy, :accessible => true

  belongs_to :program

  # --- Permissions --- #

  def create_permitted?
    acting_user.signed_up?
  end

  def update_permitted?
    acting_user.signed_up?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
