class Tcl < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name  :string, :default => "TCL"
    timestamps
  end

  belongs_to :event
  belongs_to :tcap

  #has_many :tcl_alevels, :accessible => true
  #has_many :alevels, :through => :tcl_alevels
  belongs_to :alevel

  has_many :strengths, :dependent => :destroy, :accessible => true
  has_many :improvement_areas, :dependent => :destroy, :accessible => true
  has_many :tcl_goals, :dependent => :destroy, :accessible => true
  has_many :tcl_objectives, :dependent => :destroy, :accessible => true
  has_many :corrective_actions, :dependent => :destroy
  children :corrective_actions

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
