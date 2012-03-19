class Disdec < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string, :default => 'Disaster Declarations'
    timestamps
  end

  belongs_to :program
  has_many :uploads, :dependent => :destroy
  has_many :disaster_declarations, :dependent => :destroy, :accessible => true
  has_many :state_disdecs, :dependent => :destroy, :accessible => true
  has_many :local_disdecs, :dependent => :destroy, :accessible => true

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
