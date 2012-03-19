class TclAlevel < ActiveRecord::Base

  hobo_model # Don't put anything above this

#  fields do
#    improvement_plan           :boolean
#    improvement_plan_completed :boolean
#    timestamps
#  end

#  belongs_to :tcl

#  belongs_to :alevel

#  has_many :strengths, :dependent => :destroy, :accessible => true
#  has_many :improvement_areas, :dependent => :destroy, :accessible => true
#  has_many :tcl_goals, :dependent => :destroy, :accessible => true
#  has_many :tcl_objectives, :dependent => :destroy, :accessible => true

  # --- Permissions --- #

#  def create_permitted?
#    acting_user.administrator?
#  end

#  def update_permitted?
#    acting_user.administrator?
#  end

#  def destroy_permitted?
#    acting_user.administrator?
#  end

#  def view_permitted?(field)
#    true
#  end

end
